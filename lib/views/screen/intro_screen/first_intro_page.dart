import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            Image.asset("assets/images/first.jpg"),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  await prefs.setBool('firstVisited', true);
                  Navigator.of(context).pushReplacementNamed('second_intro_page');
                },
                child: Text(" NEXT "))
          ],
        ),
      ),
    );
  }
}