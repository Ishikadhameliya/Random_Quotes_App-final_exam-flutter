import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Model/quotes_Model.dart';
import '../../cantroller/quotes_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Quotes",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  // Quote? quote = await QuoteAPIHelper.quoteAPIHelper.fetchQuoteData();
                  // if (quote != null) {
                  //   DBHelpers.dbHelpers.insertData(data: quote);

                  setState(() {});
                },
                //   else {
                //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content: Text("Data Not found ....."),
                //       backgroundColor: Colors.red,
                //       behavior: SnackBarBehavior.floating,
                //     ));
                //   }
                // },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: Consumer<JokeController>(builder: (context, value, _) {
          return FutureBuilder<JokeModel>(
              future: value.getJoke(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      child: Column(
                        children: [
                        Card(
                        elevation: 3,
                        color: Colors.blue.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                snapshot.data!.value,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(child: const CircularProgressIndicator());
                }
              });
        }));
  }
}
