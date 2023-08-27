import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/presentaion/product_details_screen/views/product_details_screen.dart';
import 'package:kistler/repository/api/categories_screen/models/get_all_products_res_model.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.productData});
  final Product productData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetailsScreen())),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(width: .4, color: ColorConstant.kistlerGridBoeder),
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                  //TODO: need to be updated with no image
                  width: 80,
                  child: productData.brandImage != null
                      ? Image.network(productData.brandImage!)
                      : SizedBox()),
              Center(
                child: Container(
                    height: 100,
                    child: productData.defaultImage != null
                        ? Image.network(productData.defaultImage!)
                        : SizedBox()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData.ttitle ?? "N/a",
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.kistlerTextColor),
                  ),
                  // Text(
                  //   "PLC-Controlled",
                  //   style: TextStyle(color: ColorConstant.kistlerTextColor),
                  // ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
