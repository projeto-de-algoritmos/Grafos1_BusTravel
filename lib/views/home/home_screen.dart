// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grafos1_bus/views/home/widgets/home_app_bar.dart';
import 'package:grafos1_bus/views/home/widgets/home_search_city.dart';
import 'package:grafos1_bus/views/home/widgets/home_suggestion_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height * 0.53,
        child: Stack(
          children: [HomeAppBar(), HomeSearchCity()],
        ),
      ),
    );
  }
}
