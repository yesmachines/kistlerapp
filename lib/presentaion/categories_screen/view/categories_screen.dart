import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/custom_search_field.dart';
import 'package:kistler/presentaion/categories_screen/controller/categories_screen_controller.dart';
import 'package:kistler/presentaion/categories_screen/view/tabs/tab_all_screen.dart';
import 'package:kistler/presentaion/categories_screen/view/tabs/tab_screen_cutter.dart';
import 'package:provider/provider.dart';
import 'tabs/tab_view_welding.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CategoriesScreenController>(context, listen: false)
          .getAllProducts(language: context.locale);
      await Provider.of<CategoriesScreenController>(context, listen: false)
          .getCuttingProductsLidt(language: context.locale);
      await Provider.of<CategoriesScreenController>(context, listen: false)
          .getWeldingProductsLidt(language: context.locale);
    });
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(children: [
        Container(
          decoration:
              BoxDecoration(color: ColorConstant.kistlerWhite, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: Offset(1, 3),
            ),
          ]),
          height: 70,
          child: Center(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * .80,
              child: CustomSearchField(),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TabBar(
          isScrollable: true,
          unselectedLabelColor: ColorConstant.kistlerBrandBorder,
          indicatorColor: ColorConstant.kistlerBrandGreen,
          labelColor: ColorConstant.kistlerBrandGreen,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          indicatorWeight: 4,
          // padding: EdgeInsets.symmetric(horizontal: 50),
          labelPadding: EdgeInsets.symmetric(horizontal: 30),
          indicatorPadding: EdgeInsets.only(left: 8, right: 8),
          tabs: [
            Tab(text: LocaleKeys.all.tr()),
            Tab(text: LocaleKeys.cutting.tr()),
            Tab(text: LocaleKeys.welding.tr()),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              TabAllViewScreen(),
              TabScreenCutter(),
              TabScreenWelding(),
            ],
          ),
        )
      ]),
    );
  }
}
