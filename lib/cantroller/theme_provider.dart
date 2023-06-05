import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/themeodel.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeModel themeModel ;

  ThemeProvider({required this.themeModel});


  changeTheme()async{
    themeModel.isDarkMode = !themeModel.isDarkMode;
    notifyListeners();

    SharedPreferences preferences =  await SharedPreferences.getInstance();
    preferences.setBool('isdark', themeModel.isDarkMode);
  }

}