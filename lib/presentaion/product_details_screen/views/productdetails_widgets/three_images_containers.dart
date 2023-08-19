import 'package:flutter/material.dart';

class ThreeImagesContainers extends StatelessWidget {
  const ThreeImagesContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 68,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            child: Image.asset(
              "assets/images/item.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 68,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            child: Image.asset(
              "assets/images/item.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 68,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            child: Image.asset(
              "assets/images/item.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
