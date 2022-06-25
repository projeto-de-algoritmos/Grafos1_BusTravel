// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grafos1_bus/views/home/widgets/home_suggestion_field.dart';

class HomeSearchCity extends StatefulWidget {
  const HomeSearchCity({Key? key}) : super(key: key);

  @override
  State<HomeSearchCity> createState() => _HomeSearchCityState();
}

class _HomeSearchCityState extends State<HomeSearchCity> {
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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Origem",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Align(child: HomeSuggestField(), alignment: Alignment.center),
            Text(
              "Destino",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Align(child: HomeSuggestField(), alignment: Alignment.center),
            MaterialButton(
              onPressed: () {},
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
