import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';

class ProductImagesListContainers extends StatelessWidget {
  const ProductImagesListContainers(
      {super.key, required this.productImageList});
  final List<ProductImage> productImageList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(productImageList.length, (index) {
        return Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CommonImageView(
              fit: BoxFit.fill,
              url: productImageList[index].imageUrl,
            ),
          ),
        );
      })),
    );
  }
}
