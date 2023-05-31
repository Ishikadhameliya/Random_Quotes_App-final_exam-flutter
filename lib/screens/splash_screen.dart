import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List quotes = [
    '"The greatest glory in living lies not in never falling, but in rising every time we fall."',
    '"The way to get started is to quit talking and begin doing."',
    '"Your time is limited, so do not waste it living someone else life. Dont be trapped by dogma – which is living with the results of other peoples thinking."',
    '"If life were predictable it would cease to be life, and be without flavor."',
    '"Life is what happens when you are busy making other plans."',
    '"Always remember that you are absolutely unique. Just like everyone else."',
    '"Do not judge each day by the harvest you reap but by the seeds that you plant."',
    '"It is during our darkest moments that we must focus to see the light."',
  ];
  List color = [
    Colors.blue,
    Colors.deepOrange,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.deepPurpleAccent,
    Colors.brown,
    Colors.yellow,
    Colors.tealAccent,
  ];
  @override
  void initState() {
    super.initState();
    Duration duration = const Duration(seconds: 5);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/');
    });
    color.shuffle();
    quotes.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        color: color.first,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              textAlign: TextAlign.center,
              "${quotes.first}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 40),
            Spacer(),
            Text(
              "Life Quotes",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
