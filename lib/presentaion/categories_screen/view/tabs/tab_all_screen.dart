import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/categories_screen/controller/categories_screen_controller.dart';
import 'package:kistler/presentaion/categories_screen/view/widgets/products_category_subcategory_card.dart';
import 'package:provider/provider.dart';

class TabAllViewScreen extends StatefulWidget {
  const TabAllViewScreen({super.key});

  @override
  State<TabAllViewScreen> createState() => _TabAllViewScreenState();
}

class _TabAllViewScreenState extends State<TabAllViewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoriesScreenController>(context, listen: false)
          .getAllProducts(language: context.locale);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoriesScreenController>(context);
    final categorylist = provider.allProductsData?.categoriesList ?? [];
    return provider.isLoading
        ? Center(
            child: ReusableLoadingIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: categorylist.isEmpty
                ? Center(
                    child: Text("No data found"),
                  )
                : ListView.builder(
                    itemCount: categorylist.length,
                    itemBuilder: (context, index) {
                      final categoryData = categorylist[index];
                      return ProductCategorySubCategoryCard(
                          categoryName: categoryData.title ?? "N/a",
                          subcategoryList:
                              categoryData.subcategoriesList ?? []);
                    },
                  ));
  }
}
