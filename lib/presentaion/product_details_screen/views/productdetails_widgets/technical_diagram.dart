import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';

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
        return Container(
            child: CommonImageView(
          fit: BoxFit.fill,
          url: imageList[index].imageUrl,
        )

            //  Image.asset(
            //   ,
            //   fit: BoxFit.cover,
            // ),
            );
      },
      itemCount: imageList.length,
    );
  }
}
