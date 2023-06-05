import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Model/quotes_Model.dart';

class JokeController extends ChangeNotifier {
  var url = "https://api.chucknorris.io/jokes/random";

  Future<JokeModel> getJoke() async {
    var modelData;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final mockData = json.decode(response.body);
        modelData = JokeModel.fromJson(mockData);
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    return modelData;
  }
}
