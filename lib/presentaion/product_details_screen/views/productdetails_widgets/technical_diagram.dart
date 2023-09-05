import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';
import 'package:photo_view/photo_view.dart';

class TechnicalDiagram extends StatelessWidget {
  const TechnicalDiagram({super.key, required this.imageList});

  final List<ProductTechnicalDiagram> imageList;

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Colors.transparent,
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        imageList[index].imageUrl != null
                            ? PhotoView(
                                backgroundDecoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                imageProvider: NetworkImage(imageList[index]
                                        .imageUrl ??
                                    "https://www.ira-sme.net/wp-content/themes/consultix/images/no-image-found-360x260.png"),
                              )
                            : SizedBox(),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
              child: CommonImageView(
            fit: BoxFit.fill,
            url: imageList[index].imageUrl,
          )

              //  Image.asset(
              //   ,
              //   fit: BoxFit.cover,
              // ),
              ),
        );
      },
      itemCount: imageList.length,
    );
  }
}
