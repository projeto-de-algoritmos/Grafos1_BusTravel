// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grafos1_bus/common.dart';
import 'package:grafos1_bus/views/home/widgets/home_app_bar.dart';
import 'package:grafos1_bus/views/home/widgets/home_info_card.dart';
import 'package:grafos1_bus/views/home/widgets/home_search_city.dart';
import 'package:grafos1_bus/model/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> suggestions = [];
  ValueNotifier test = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.53,
              child: Stack(
                children: [
                  HomeAppBar(),
                  HomeSearchCity(suggestions: suggestions),
                ],
              ),
            ),
            ValueListenableBuilder<List<Path>>(
              valueListenable: Global.shortestPath,
              builder: (BuildContext context, List<Path> path, Widget? child) {
                return HomeInfoCard(
                  title: "Sua viagem mais rápida:",
                  city1: Global.travelResult.fromSymbol,
                  city1Name: Global.travelResult.from,
                  city2: Global.travelResult.toSymbol,
                  city2Name: Global.travelResult.to,
                  info:
                      "Tempo total: ${Global.travelResult.shortestTravel} horas",
                  path: Global.shortestPath.value,
                  isDuration: true,
                );
              },
            ),
            ValueListenableBuilder<List<Path>>(
              valueListenable: Global.cheapestPath,
              builder: (BuildContext context, List<Path> path, Widget? child) {
                return HomeInfoCard(
                  title: "Sua viagem mais barata:",
                  city1: Global.travelResult.fromSymbol,
                  city1Name: Global.travelResult.from,
                  city2: Global.travelResult.toSymbol,
                  city2Name: Global.travelResult.to,
                  info: "Preço: ${Global.travelResult.cheapestTravel}",
                  path: Global.cheapestPath.value,
                  isDuration: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
