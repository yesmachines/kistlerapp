import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

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
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    child: Container(
                        height: MediaQuery.of(context).size.height * .60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            PhotoView(
                              imageProvider: AssetImage(imageList[index]),
                            ),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        )));
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    imageList[index],
                  ),
                  fit: BoxFit.cover,
                )),
          ),
        );
      },
      itemCount: 4,
    );
  }
}
