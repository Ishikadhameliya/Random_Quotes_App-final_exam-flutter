import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;
  bool autoPlay = false;

  List images = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
  ];

  TextStyle heading = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    List button = [
      {
        'icon': Icons.category_outlined,
        'color': Colors.pink,
        'name': "Categories",
      },
      {
        'icon': Icons.image_outlined,
        'color': Colors.purple,
        'name': "Pic Quotes",
      },
      {
        'icon': Icons.settings,
        'color': Colors.amber,
        'name': "Latest Quotes",
      },
      {
        'icon': Icons.book,
        'color': Colors.green,
        'name': "Articles",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text(
          "Life Quotes",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.amber,
              )),
          IconButton(
              onPressed: () {
                showDialog<void>(
                  context: (context),
                  builder: (BuildContext dialogContext) {
                    return Dialog(
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              '😀',
                              style: TextStyle(fontSize: 50),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Like our App?'),
                          const SizedBox(height: 10),
                           Text(
                            textAlign: TextAlign.center,
                            "would you mind taking a moment to raye it and provide us your valuable reviews and suggestions.",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 20),
                          const Text("Thanks for your support!"),
                          const SizedBox(height: 30),
                          const Text(
                            "⭐⭐⭐⭐⭐",
                            style: TextStyle(fontSize: 40),
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("RATE US")),
                          TextButton(
                            child: const Text('not now'),
                            onPressed: () {
                              Navigator.of(dialogContext)
                                  .pop(); // Dismiss alert dialog
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),
        ],
      ),
      drawer: const SideDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    initialPage: photoIndex,
                    clipBehavior: Clip.hardEdge,
                    onPageChanged: (i, _) {
                      setState(() {
                        photoIndex = i;
                      });
                    },
                    height: 260,
                    viewportFraction: 0.97,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: images.map((e) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: AnimatedSmoothIndicator(
                    activeIndex: photoIndex,
                    count: images.length,
                    effect: const WormEffect(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...button
                    .map((e) => Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('random');
                              },
                              child: Icon(e["icon"]),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(e['name']),
                            ),
                          ],
                        ))
                    .toList(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Text(
                "Most Popular",
                style: heading,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('patience');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 10,
                        left: 10,
                        right: 0,
                      ),
                      child: contin(
                          path: "assets/images/pati.jpg",
                          label: " Patience Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('forgive');
                    },
                    child: Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        child: contin(
                            path: "assets/images/for.jpg",
                            label: " Forgiveness Quotes")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('motivational');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 0,
                        left: 10,
                        right: 0,
                      ),
                      child: contin(
                          path: "assets/images/moti.jpg",
                          label: " Motivational Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('learning');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 0,
                        left: 10,
                        right: 10,
                      ),
                      child: contin(
                          path: "assets/images/learn.jpg",
                          label: " Learning Quotes"),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Text(
                "Quotes by category",
                style: heading,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('attitude');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 10,
                        left: 10,
                        right: 0,
                      ),
                      child: contin(
                          path: "assets/images/atti.jpg",
                          label: " Attitude Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('bravery');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 10,
                        left: 10,
                        right: 10,
                      ),
                      child: contin(
                          path: "assets/images/brav.jpg",
                          label: " Bravery Quotes"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('confidence');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 10,
                        left: 10,
                        right: 0,
                      ),
                      child: contin(
                          path: "assets/images/conf.jpg",
                          label: " Confidence Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('enterprenur');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 10,
                        left: 10,
                        right: 10,
                      ),
                      child: contin(
                          path: "assets/images/enter.jpg",
                          label: " Enterpreneur Quotes"),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(19),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(height: 50),
                  Text(
                    "Today's Quote",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    textAlign: TextAlign.center,
                    "You can adopt the attitude there is nothing you can do, or you can see the challenge as your call to action.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "- Catherine Pulsifer",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  contin({
    required String path,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.black, spreadRadius: 0.1, blurRadius: 5),
            ],
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            " ${label}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
