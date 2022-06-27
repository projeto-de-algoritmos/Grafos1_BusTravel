import 'package:flutter/material.dart';
import 'package:grafos1_bus/common.dart';
import 'package:grafos1_bus/controller/grafo.dart';
import 'package:grafos1_bus/service/home_service.dart';
import 'package:grafos1_bus/views/home/home_screen.dart';

void main() async {
  await HomeService.getData();
  Grafo.buildGraph();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
