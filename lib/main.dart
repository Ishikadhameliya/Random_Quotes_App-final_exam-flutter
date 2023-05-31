import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_quotes_app/screens/attitude.dart';
import 'package:random_quotes_app/screens/bravery.dart';
import 'package:random_quotes_app/screens/confidence.dart';
import 'package:random_quotes_app/screens/enterpreneur.dart';
import 'package:random_quotes_app/screens/forgive.dart';
import 'package:random_quotes_app/screens/home_page.dart';
import 'package:random_quotes_app/screens/learning.dart';
import 'package:random_quotes_app/screens/motivational.dart';
import 'package:random_quotes_app/screens/patience.dart';
import 'package:random_quotes_app/screens/random.dart';
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
        'random': (context) => const Random(),
        'patience': (context) => const Patience(),
        'forgive': (context) => const Forgive(),
        'motivational': (context) => const Motivational(),
        'learning': (context) => const Learning(),
        'attitude': (context) => const Attitude(),
        'bravery': (context) => const Bravery(),
        'confidence': (context) => const Confidence(),
        'enterprenur': (context) => const Enterpreneur(),
      },
    ),
  );
}
