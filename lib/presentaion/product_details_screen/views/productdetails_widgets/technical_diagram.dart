import 'package:flutter/material.dart';

class TechnicalDiagram extends StatelessWidget {
  const TechnicalDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "assets/welding/11.jpg",
      "assets/welding/12.png",
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          mainAxisExtent: 170,
          crossAxisSpacing: 10.0,
          childAspectRatio: .8),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Image.asset(
            imageList[index],
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: imageList.length,
    );
  }
}
