import 'package:flutter/material.dart';
import 'package:grafos1_bus/model/path.dart';
import 'package:grafos1_bus/views/travel/bottomSheet.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard(
      {Key? key,
      required this.title,
      required this.city1,
      required this.city1Name,
      required this.city2,
      required this.city2Name,
      required this.info,
      required this.path,
      required this.isDuration})
      : super(key: key);

  final String title;
  final String city1;
  final String city1Name;
  final String city2;
  final String city2Name;
  final String info;
  final List<Path> path;
  final bool isDuration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      margin: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.8,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.2),
                )
              ],
            ),
            child: MaterialButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return TravelDetails(
                      path: path,
                      isDuration: isDuration,
                    );
                  },
                );
              },
              child: path.isNotEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Text(
                                    city1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0XFF2F46F5)
                                            .withOpacity(0.75)),
                                  ),
                                  Text(
                                    city1Name,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.bus_alert,
                              color: Color(0XFF2F46F5).withOpacity(0.75),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Text(
                                    city2,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0XFF2F46F5)
                                            .withOpacity(0.75)),
                                  ),
                                  Text(
                                    city2Name,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            info,
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    )
                  : Text("Não há trajeto para a sua pesquisa!"),
            ),
          ),
        ],
      ),
    );
  }
}
