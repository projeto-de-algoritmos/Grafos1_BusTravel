import 'dart:collection';

import 'package:grafos1_bus/common.dart';
import 'package:grafos1_bus/controller/home_controller.dart';
import 'package:grafos1_bus/model/city.dart';
import 'package:grafos1_bus/model/path.dart';
import 'package:grafos1_bus/model/result.dart';

class Grafo {
  Map grafo = {};

  void addVerticeToGraph(City city) {
    if (grafo[city.name] == null) {
      grafo[city.name] = [];
    }
  }

  void buildGraph() {
    for (var element in Global.data["data"]) {
      var city = City(
          id: element["id"],
          name: element["name"],
          initials: element["initials"]);
      addVerticeToGraph(city);
    }

    for (var element in Global.data["data"]) {
      for (var trecho in (element["paths"] as List)) {
        var path = Path(
            id: trecho["id"],
            from: trecho["from"],
            to: trecho["to"],
            duration: trecho["duration"],
            price: trecho["price"]);
        grafo[element["name"]].add(path);
      }
    }
  }

  List<Path> returnAllEdges() {
    List<Path> allEdges = [];

    grafo.forEach((key, value) {
      value.forEach((element) {
        allEdges.add(element);
      });
    });

    return allEdges;
  }

  List<Path> bellmanFord(String source, String destination, bool isDuration) {
    Map<String, double> distance = {};
    Map<String, List<Path>> trajetos = {};

    distance[source] = 0.0;
    trajetos[source] = [];

    bool shouldUpdate(String from, String to, var value) {
      if (!distance.containsKey(from)) return false;
      double pesoFrom = distance[from]!;
      double pesoTo = distance[to] ?? (pesoFrom) + value;

      return pesoFrom + value <= pesoTo;
    }

    for (Path edge in returnAllEdges()) {
      String from = edge.from;
      String to = edge.to;
      var peso = isDuration ? edge.duration : edge.price;

      if (shouldUpdate(from, to, peso)) {
        distance[to] = distance[from]! + peso;
        if (trajetos[to] == null) trajetos[to] = [];
        trajetos[to]!.addAll(trajetos[from]!);
        trajetos[to]!.add(edge);
      }
    }

    HomeController.createResultObject(
        source, destination, isDuration, distance[destination]);

    return trajetos[destination]!;
  }
}
