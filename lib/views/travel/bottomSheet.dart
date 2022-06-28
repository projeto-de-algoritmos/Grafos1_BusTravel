import 'package:flutter/material.dart';
import 'package:grafos1_bus/controller/home_controller.dart';
import 'package:grafos1_bus/model/path.dart';

class TravelDetails extends StatelessWidget {
  const TravelDetails({Key? key, required this.path, required this.isDuration})
      : super(key: key);

  final List<Path> path;
  final bool isDuration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int counter = 1;
    return SizedBox(
      width: size.width,
      height: size.height * 0.5,
      child: Container(
        margin: const EdgeInsets.only(top: 35),
        padding: const EdgeInsets.only(top: 45, left: 25, right: 25),
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.05),
              child: Text(
                "Seu Trajeto",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            ...HomeController.buildWidgetsTravel(path, isDuration)
          ],
        ),
      ),
    );
  }
}
