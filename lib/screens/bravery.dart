import 'package:share_plus/share_plus.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/db_helper.dart';
import '../models/db_model.dart';

class Bravery extends StatefulWidget {
  const Bravery({Key? key}) : super(key: key);

  @override
  State<Bravery> createState() => _BraveryState();
}

class _BraveryState extends State<Bravery> {
  late Future<List<QUT>> getAllQuotes;

  fetch() async {
    Future.delayed(
        const Duration(seconds: 6),
        () => setState(() {
              getAllQuotes = DBHelper.dbHelper.fetachAllBraveryRecords();
            }));
  }

  forGetVariable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isBraveryArrived = prefs.getBool('braveryArrived') ?? false;

    (isBraveryArrived == false)
        ? DBHelper.dbHelper.lodeBraveryJasonBank()
        : getAllQuotes = DBHelper.dbHelper.fetachAllBraveryRecords();
  }

  @override
  void initState() {
    super.initState();
    forGetVariable();
    getAllQuotes = DBHelper.dbHelper.fetachAllBraveryRecords();

    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Bravery Quotes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAllQuotes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.hasError}"),
            );
          } else if (snapshot.hasData) {
            List<QUT> data = snapshot.data as List<QUT>;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 10,
                    child: Container(
                      alignment: Alignment.center,
                      height: 400,
                      decoration: BoxDecoration(
                          color: (i % 2 == 0) ? Colors.lightBlue : Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              "${data[i].quote}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              "- ${data[i].name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await Share.share("Name: ${data[i].quote}");
                                  },
                                  icon: const Icon(
                                    Icons.share,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.download,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.star,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // title: Text("${data[i].name}"),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  isDataArrived() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('braveryArrived', true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isDataArrived();
  }
}
