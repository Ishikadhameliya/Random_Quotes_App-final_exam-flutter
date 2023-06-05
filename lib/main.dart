import 'package:flutter/material.dart';
import 'package:random_quotes_app/screens/home_page.dart';
import 'package:random_quotes_app/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intoScreen/first.dart';
import 'intoScreen/second.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isFirstVisited = prefs.getBool('firstVisited') ?? false;
  bool? isSecondVisited = prefs.getBool('secondVisited') ?? false;
  runApp(
    MaterialApp(
      theme: (
      ThemeData(
        useMaterial3: true,
      )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: (isFirstVisited == false)
          ? 'first'
          : (isSecondVisited == true)
              ? 'splash'
              : 'second',
      routes: {
        'splash': (context) => const SplashScreen(),
        'first': (context) => const First(),
        'second': (context) => const Second(),
        '/': (context) => const HomePage(),
       },
    ),
  );
}
