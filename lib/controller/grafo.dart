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
}
