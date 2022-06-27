// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grafos1_bus/views/home/widgets/home_app_bar.dart';
import 'package:grafos1_bus/views/home/widgets/home_info_card.dart';
import 'package:grafos1_bus/views/home/widgets/home_search_city.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> suggestions = [];

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
            HomeInfoCard(
              title: "Sua viagem mais rápida:",
              city1: "RJ",
              city1Name: "Rio de Janeiro",
              city2: "SSA",
              city2Name: "Salvador",
              info: "Tempo total: 12 horas",
            ),
            HomeInfoCard(
              title: "Sua viagem mais barata:",
              city1: "RJ",
              city1Name: "Rio de Janeiro",
              city2: "SSA",
              city2Name: "Salvador",
              info: "Preço: R\$ 900",
            ),
          ],
        ),
      ),
    );
  }
}
