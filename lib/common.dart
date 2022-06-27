import 'package:flutter/material.dart';
import 'package:grafos1_bus/model/path.dart';
import 'package:grafos1_bus/model/result.dart';

import 'controller/grafo.dart';

class Global {
  static dynamic data = {};
  static Grafo grafo = Grafo();
  static ValueNotifier<List<Path>> cheapestPath = ValueNotifier([]);
  static ValueNotifier<List<Path>> shortestPath = ValueNotifier([]);
  static ValueNotifier<bool> isDolarSelected = ValueNotifier(false);
  static TravelResult travelResult = TravelResult(
      from: "",
      to: "",
      fromSymbol: "",
      cheapestTravel: null,
      shortestTravel: 60,
      toSymbol: "");
}
