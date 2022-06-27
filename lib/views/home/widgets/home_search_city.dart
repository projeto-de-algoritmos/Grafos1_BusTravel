// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grafos1_bus/common.dart';
import 'package:grafos1_bus/controller/home_controller.dart';
import 'package:grafos1_bus/model/path.dart';
import 'package:grafos1_bus/views/home/widgets/home_suggestion_field.dart';

class HomeSearchCity extends StatefulWidget {
  const HomeSearchCity({Key? key, required this.suggestions}) : super(key: key);

  final List<String> suggestions;

  @override
  State<HomeSearchCity> createState() => _HomeSearchCityState();
}

class _HomeSearchCityState extends State<HomeSearchCity> {
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.35,
        width: size.width * 0.8,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(25),
              right: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Origem",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Align(
                child: HomeSuggestField(
                  suggestions: widget.suggestions,
                  controller: controller.originController,
                ),
                alignment: Alignment.center),
            Text(
              "Destino",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Align(
                child: HomeSuggestField(
                  suggestions: widget.suggestions,
                  controller: controller.destinationController,
                ),
                alignment: Alignment.center),
            MaterialButton(
              onPressed: () {
                Global.shortestPath.value = Global.grafo.bellmanFord(
                    controller.originController.text,
                    controller.destinationController.text,
                    true);
                Global.cheapestPath.value = Global.grafo.bellmanFord(
                    controller.originController.text,
                    controller.destinationController.text,
                    false);
                super.setState(() {});
              },
              minWidth: size.width * 0.8,
              color: Color(0XFF2F46F5).withOpacity(0.75),
              child: Text(
                "Realizar busca!",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
