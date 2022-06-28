import 'package:flutter/material.dart';
import 'package:grafos1_bus/common.dart';
import 'package:grafos1_bus/model/result.dart';
import 'package:grafos1_bus/model/path.dart';
import 'package:intl/intl.dart';

class HomeController {
  final originController = TextEditingController();
  final destinationController = TextEditingController();

  static String formatValue(double price) {
    final ptCurrency = NumberFormat.simpleCurrency(locale: "pt_BR");

    return ptCurrency.format(price);
  }

  static void createResultObject(
      String source, String destination, bool isDuration, double? value) {
    if (isDuration) {
      String originInitials = "";
      String destinationInitials = "";

      List cities = Global.data["data"];
      for (var element in cities) {
        if (element["name"] == source) {
          originInitials = element["initials"];
        } else if (element["name"] == destination) {
          destinationInitials = element["initials"];
        }
      }
      double result = value! / 60;
      Global.travelResult = TravelResult(
        shortestTravel: result.toStringAsFixed(1),
        from: source,
        fromSymbol: originInitials,
        to: destination,
        toSymbol: destinationInitials,
        cheapestTravel: null,
      );
    } else {
      Global.travelResult.cheapestTravel = formatValue(value!);
    }
  }

  static buildWidgetsTravel(List<Path> path, bool isDuration) {
    List<Widget> widgets = [];
    String value = "";
    path.forEach((element) {
      if (isDuration)
        value = (element.duration / 60).toStringAsFixed(1) + " horas";
      else
        value = formatValue(element.price);
      widgets.add(
        Text(
          "${element.from} até ${element.to} ($value)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    });

    return widgets;
  }
}
