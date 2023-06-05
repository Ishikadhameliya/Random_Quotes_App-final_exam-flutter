import 'package:flutter/material.dart';
import '../helper/api_helpers.dart';
import '../helper/db_helpers.dart';
import '../models/api_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Quote App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async{
                Quote? quote = await QuoteAPIHelper.quoteAPIHelper.fetchQuoteData();
                if (quote != null) {
                  DBHelpers.dbHelpers.insertData(data: quote);

                  setState(() {});
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Data Not found ....."),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: FutureBuilder(
        future: DBHelpers.dbHelpers.fetchAllData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.hasError}"),
            );
          } else if (snapshot.hasData) {
            List<Map<String, dynamic>>? data = snapshot.data;

            return ListView.builder(
                itemCount: data?.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 3,
                    color: Colors.blue.shade100,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "${data![i]["quoteContent"]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
