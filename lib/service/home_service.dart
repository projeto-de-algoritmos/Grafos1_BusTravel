import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grafos1_bus/common.dart';

class HomeService {
  static Future<dynamic> getData() async {
    WidgetsFlutterBinding.ensureInitialized();
    String cryptoData = await rootBundle.loadString("data.json");

    Global.data = json.decode(cryptoData);

    return Global.data;
  }

  static List<String> buildSuggestions(String query) {
    var cityList = Global.data["data"] as List;

    List<String> resultList = [];

    for (var element in cityList) {
      if (element["name"]
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) resultList.add(element["name"]);
    }

    return resultList;
  }
}
