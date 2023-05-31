import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';

import '../models/db_model.dart';
import '../models/quotes_api.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  final String dbName = "demo.db";
  final String tableRandom = "randomQuotes";
  final String tablePatience = "patienceQuotes";
  final String tableForgive = "forgiveQuotes";
  final String tableMotivational = "motivationalQuotes";
  final String tableLearning = "learningQuotes";
  final String tableAttitude = "attitudeQuotes";
  final String tableBravery = "braveryQuotes";
  final String tableConfidence = "confidenceQuotes";
  final String tableEnterprenur = "enterprenurQuotes";

  final String colId = 'id';
  final String colQuote = 'quote';
  final String colName = 'name';

  Database? db;

  //Initalize db
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String query1 =
            "CREATE TABLE IF NOT EXISTS $tableRandom($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query2 =
            "CREATE TABLE IF NOT EXISTS $tablePatience($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query3 =
            "CREATE TABLE IF NOT EXISTS $tableForgive($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query4 =
            "CREATE TABLE IF NOT EXISTS $tableMotivational($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query5 =
            "CREATE TABLE IF NOT EXISTS $tableLearning($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query6 =
            "CREATE TABLE IF NOT EXISTS $tableAttitude($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query7 =
            "CREATE TABLE IF NOT EXISTS $tableBravery($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query8 =
            "CREATE TABLE IF NOT EXISTS $tableConfidence($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";
        String query9 =
            "CREATE TABLE IF NOT EXISTS $tableEnterprenur($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colQuote TEXT,$colName Text);";

        await db.execute(query1);
        await db.execute(query2);
        await db.execute(query3);
        await db.execute(query4);
        await db.execute(query5);
        await db.execute(query6);
        await db.execute(query7);
        await db.execute(query8);
        await db.execute(query9);

        print("================================");
        print("succes");
        print("================================");
      },
    );
  }

  //======================================== insrt ================================================================

  // insert Random record
  Future<int?> insertRandomRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableRandom($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Random $id");
    print("================================");
    return id;
  }

  // insert Patience record
  Future<int?> insertPatienceRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tablePatience($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Patience $id");
    print("================================");
    return id;
  }

  // insert Forgive record
  Future<int?> insertForgiveRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableForgive($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Forgive $id");
    print("================================");
    return id;
  }

  // insert Motivational record
  Future<int?> insertMotivationalecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableMotivational($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Motivational $id");
    print("================================");
    return id;
  }

  // insert Learning record
  Future<int?> insertLearningRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableLearning($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Learning $id");
    print("================================");
    return id;
  }

  // insert Attitude record
  Future<int?> insertAttitudeRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableAttitude($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Attitude $id");
    print("================================");
    return id;
  }

  // insert Bravery record
  Future<int?> insertBraveryRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableBravery($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Bravery $id");
    print("================================");
    return id;
  }

  // insert Confidence record
  Future<int?> insertConfidenceRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableConfidence($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Confidence $id");
    print("================================");
    return id;
  }

  // insert Enterprenur record
  Future<int?> insertEnterprenurRecord({
    required String quote,
    required String name,
  }) async {
    await initDB();
    String query =
        "INSERT INTO $tableEnterprenur($colQuote, $colName) VALUES(?, ?);";

    List args = [quote, name];

    int id = await db!.rawInsert(query, args);

    print("================================");
    print("inserted Enterprenur $id");
    print("================================");
    return id;
  }

  //========================================fetch==========================================================

  // fetchAllRendomRecords()
  Future<List<QUT>> fetachRandomAllRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableRandom";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched");
    print("================================");

    return quotes;
  }

  // fetchAllPatienceRecords()
  Future<List<QUT>> fetachAllPatienceRecords() async {
    await initDB();

    String query = "SELECT * FROM $tablePatience";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Patirnce ");
    print("================================");

    return quotes;
  }

  // fetchAllForgiveRecords()
  Future<List<QUT>> fetachAllForgiveRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableForgive";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Forgive ");
    print("================================");

    return quotes;
  }

  // fetchAllMotivationalRecords()
  Future<List<QUT>> fetachAllMotivationalRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableMotivational";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Motivational ");
    print("================================");

    return quotes;
  }

  // fetchAllLearningRecords()
  Future<List<QUT>> fetachAllLearningRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableLearning";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Learning ");
    print("================================");

    return quotes;
  }

  // fetchAllAttitudeRecords()
  Future<List<QUT>> fetachAlAttitudeRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableAttitude";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Attitude ");
    print("================================");

    return quotes;
  }

  // fetchAllBraveryRecords()
  Future<List<QUT>> fetachAllBraveryRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableBravery";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Bravery ");
    print("================================");

    return quotes;
  }

  // fetchAllConfidenceRecords()
  Future<List<QUT>> fetachAllConfidenceRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableConfidence";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Confidence ");
    print("================================");

    return quotes;
  }

  // fetchAllEnterprenurRecords()
  Future<List<QUT>> fetachAlEnterprenurRecords() async {
    await initDB();

    String query = "SELECT * FROM $tableEnterprenur";

    List<Map<String, dynamic>> allQuotes = await db!.rawQuery(query);

    List<QUT> quotes = allQuotes.map((e) => QUT.fromMap(e)).toList();

    print("================================");
    print("fetched Enterprenur ");
    print("================================");

    return quotes;
  }

  //=========================================loadfrom json==================================================

  //load Random jsonn
  lodeRandonJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/randomquotes.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromRandom(json: e)).toList();

    quotes
        .map((e) =>
            DBHelper.dbHelper.insertRandomRecord(quote: e.data, name: e.name))
        .toList();
  }

  //load Patience jsonn
  lodePatienceJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/patience.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromPatience(json: e)).toList();

    quotes
        .map((e) =>
            DBHelper.dbHelper.insertPatienceRecord(quote: e.data, name: e.name))
        .toList();
  }

  //load Forgive jsonn
  lodeForgiveJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/forgive.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromPatience(json: e)).toList();

    quotes
        .map((e) =>
            DBHelper.dbHelper.insertForgiveRecord(quote: e.data, name: e.name))
        .toList();
  }

  //load Motivational jsonn
  lodeMotivationalJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/motivational.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromPatience(json: e)).toList();

    quotes
        .map((e) => DBHelper.dbHelper
            .insertMotivationalecord(quote: e.data, name: e.name))
        .toList();
  }

//load Learning jsonn
  lodeLearningJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/learning.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromPatience(json: e)).toList();

    quotes
        .map((e) =>
            DBHelper.dbHelper.insertLearningRecord(quote: e.data, name: e.name))
        .toList();
  }

//load Attitude jsonn
  lodeAttitudeJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/attitude.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromPatience(json: e)).toList();

    quotes
        .map((e) =>
            DBHelper.dbHelper.insertAttitudeRecord(quote: e.data, name: e.name))
        .toList();
  }

//load Bravery jsonn
  lodeBraveryJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/bravery.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromPatience(json: e)).toList();

    quotes
        .map((e) =>
            DBHelper.dbHelper.insertBraveryRecord(quote: e.data, name: e.name))
        .toList();
  }

//load Confidence jsonn
  lodeConfidenceJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/confidence.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromPatience(json: e)).toList();

    quotes
        .map((e) => DBHelper.dbHelper
            .insertConfidenceRecord(quote: e.data, name: e.name))
        .toList();
  }

//load Enterprenur jsonn
  lodeEnterprenurJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/enterpreneur.json");

    List res = jsonDecode(jsonData);

    List quotes = res.map((e) => Quotes.fromEnterpreneur(json: e)).toList();

    quotes
        .map((e) => DBHelper.dbHelper
            .insertEnterprenurRecord(quote: e.data, name: e.name))
        .toList();
  }

  //Api calling
  // QuotesAPIHelper() async {
  //   await initDB();
  //
  //   final String url = 'https://quotable.io/quotes?page=1';
  //
  //   http.Response res = await http.get(
  //     Uri.parse(url),
  //   );
  //
  //   if (res.statusCode == 200) {
  //     print("api calles");
  //     Map decodedData = jsonDecode(res.body);
  //
  //     Quotes quotesmap = Quotes.fromJson(json: decodedData);
  //
  //     List quotes = quotesmap.data
  //         .map((e) => DBHelper.dbHelper
  //             .insertRecord(quote: e['content'], name: e['author']))
  //         .toList();
  //   }
  // }

  // //deleteRecord()
  // Future<int> deleteRecord({
  //   required int id,
  // }) async {
  //   await initDB();
  //
  //   String query = "DELETE FROM $tableName WHERE $colId=?";
  //   List args = [id];
  //
  //   return await db!.rawDelete(query, args);
  // }

}
