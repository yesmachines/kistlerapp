import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/categories_screen/controller/categories_screen_controller.dart';
import 'package:kistler/presentaion/categories_screen/view/widgets/products_category_subcategory_card.dart';
import 'package:provider/provider.dart';

import '../../../../global_widgets/custom_product_container.dart';

class TabScreenWelding extends StatefulWidget {
  const TabScreenWelding({super.key});

  @override
  State<TabScreenWelding> createState() => _TabScreenWeldingState();
}

class _TabScreenWeldingState extends State<TabScreenWelding> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<CategoriesScreenController>(context, listen: false)
      //     .getWeldingProductsLidt(language: context.locale);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoriesScreenController>(context);
    final weldingsList = provider.weldingProductsList ?? [];
    return provider.isLoading
        ? Center(
            child: ReusableLoadingIndicator(),
          )
        : RefreshIndicator(
            color: ColorConstant.kistlerBrandGreen,
            onRefresh: () async {
              await Provider.of<CategoriesScreenController>(context,
                      listen: false)
                  .getWeldingProductsLidt(language: context.locale);
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: weldingsList.isEmpty
                    ? Center(
                        child: Text("No data found"),
                      )
                    : ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: weldingsList.length,
                        itemBuilder: (context, index) {
                          final categoryData = weldingsList[index];
                          return ProductCategorySubCategoryCard(
                              categoryName: categoryData.title ?? "N/a",
                              subcategoryList:
                                  categoryData.subcategoriesList ?? []);
                        },
                      )),
          );
  }
}
