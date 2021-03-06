import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      decoration: BoxDecoration(
        color: Color(0XFF2F46F5).withOpacity(0.75),
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(25),
          right: Radius.circular(25),
        ),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Viajante!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Verifique seu trajeto!",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "images/profile.jpeg",
                  width: 40,
                  height: 40,
                )),
          ],
        ),
      )),
    );
  }
}
