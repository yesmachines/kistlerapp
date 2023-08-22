import 'package:flutter/material.dart';

class ApplicationImages extends StatelessWidget {
  const ApplicationImages({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "assets/welding/1.jpeg",
      "assets/welding/2.jpeg",
      "assets/welding/3.jpeg",
      "assets/welding/4.jpeg",
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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  imageList[index],
                ),
                fit: BoxFit.cover,
              )),
        );
      },
      itemCount: 4,
    );
  }
}
