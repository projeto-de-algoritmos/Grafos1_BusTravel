import 'dart:collection';

import 'package:grafos1_bus/common.dart';
import 'package:grafos1_bus/model/city.dart';
import 'package:grafos1_bus/model/path.dart';

class Grafo {
  Map grafo = {};

  void addVerticeToGraph(City city) {
    if (grafo[city.name] == null) {
      grafo[city.name] = [];
    }
  }

  static void buildGraph() {
    for (var element in Global.data["data"]) {
      var city = City(
          id: element["id"],
          name: element["name"],
          initials: element["initials"]);
      Global.grafo.addVerticeToGraph(city);
    }

    for (var element in Global.data["data"]) {
      for (var trecho in (element["paths"] as List)) {
        var path = Path(
            id: trecho["id"],
            from: trecho["from"],
            to: trecho["to"],
            duration: trecho["duration"],
            price: trecho["price"]);
        Global.grafo.grafo[element["name"]].add(path);
      }
    }
  }

  HashMap<String, num>? bellmanFord(String source) {
    var distances = HashMap<String, num>();
    distances[source] = 0;
    var edges = grafo[source];
    var counter = grafo.length - 1;

    bool shouldUpdate(String u, String v, num w) {
      if (!distances.containsKey(u)) return false;
      var uValue = distances[u]!;
      var vValue = distances[v] ?? (uValue + w + 1);

      return uValue + w < vValue;
    }

    while (counter > 0) {
      for (var edge in edges) {
        var u = edge[0];
        var v = edge[1];
        var w = edge[2];
        if (shouldUpdate(u, v, w)) {
          distances[v] = distances[u]! + w;
        }
      }

      counter--;
    }

    for (var edge in edges) {
      var u = edge[0];
      var v = edge[1];
      var w = edge[2];
      if (shouldUpdate(u, v, w)) {
        return null;
      }
    }

    return distances;
  }
}
