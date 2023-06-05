import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_quotes_app/views/screen/home_page.dart';
import 'package:random_quotes_app/views/screen/intro_screen/first_intro_page.dart';
import 'package:random_quotes_app/views/screen/intro_screen/second_intro_page.dart';
import 'package:random_quotes_app/views/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/themeodel.dart';
import 'cantroller/quotes_controller.dart';
import 'cantroller/theme_provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isdark = preferences.getBool('isdark') ?? false;
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider(themeModel:ThemeModel(isDarkMode:isdark ))),
        ChangeNotifierProvider<JokeController>(create:(_)=>JokeController())
      ],
        builder: (context,_){return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDarkMode == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          initialRoute: 'first_intro_page',
          routes: {
            '/' : (context) => const Homepage(),
            'splash_screen' : (context) => const SplashScreen(),
            'first_intro_page' : (context) => const First(),
            'second_intro_page' : (context) => const Second(),
          },
        );},)
  );
}
