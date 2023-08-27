import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/repository/api/categories_screen/models/get_all_products_res_model.dart';

import '../../../../global_widgets/custom_product_container.dart';

class ProductCategorySubCategoryCard extends StatelessWidget {
  const ProductCategorySubCategoryCard({
    super.key,
    required this.categoryName,
    // required this.productData,
    required this.subcategoryList,
  });
  final String categoryName;
  // final Product productData;
  final List<Subcategory> subcategoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            categoryName, // LocaleKeys.cutter.tr(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: subcategoryList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, sublistIndex) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Text(
                        subcategoryList[sublistIndex].title ?? 'N/a',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: .65),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductContainer(
                          productData:
                              subcategoryList[sublistIndex].products?[index] ??
                                  Product(),
                        );
                      },
                      itemCount:
                          subcategoryList[sublistIndex].products?.length ??
                              0, // Number of items in the grid
                    ),
                  ]);
            }),
      ],
    );
  }
}
