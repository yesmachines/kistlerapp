import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/categories_screen/controller/categories_screen_controller.dart';
import 'package:kistler/presentaion/categories_screen/view/widgets/products_category_subcategory_card.dart';
import 'package:provider/provider.dart';

class TabScreenCutter extends StatefulWidget {
  const TabScreenCutter({super.key});

  @override
  State<TabScreenCutter> createState() => _TabScreenCutterState();
}

class _TabScreenCutterState extends State<TabScreenCutter> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<CategoriesScreenController>(context, listen: false)
      //     .getCuttingProductsLidt(language: context.locale);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoriesScreenController>(context);
    final cuttingsList = provider.cuttingsProductsList ?? [];
    return provider.isLoading
        ? Center(
            child: ReusableLoadingIndicator(),
          )
        : RefreshIndicator(
            color: ColorConstant.kistlerBrandGreen,
            onRefresh: () async {
              await Provider.of<CategoriesScreenController>(context,
                      listen: false)
                  .getCuttingProductsLidt(language: context.locale);
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: cuttingsList.isEmpty
                    ? Center(
                        child: Text("No data found"),
                      )
                    : ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: cuttingsList.length,
                        itemBuilder: (context, index) {
                          final categoryData = cuttingsList[index];
                          return ProductCategorySubCategoryCard(
                              categoryName: categoryData.title ?? "N/a",
                              subcategoryList:
                                  categoryData.subcategoriesList ?? []);
                        },
                      )),
          );
  }
}
