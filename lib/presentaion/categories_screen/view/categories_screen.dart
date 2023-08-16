import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/search_bar.dart';
import 'package:kistler/presentaion/tab_all_screen/view/tab_all_screen.dart';
import 'package:kistler/presentaion/tab_screen_cutter/view/tab_screen_cutter.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final ScrollController _scrollController = ScrollController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
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
                child: SearchBarRefactor(),
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
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            indicatorWeight: 4,
            indicatorPadding: EdgeInsets.only(left: 8, right: 8),
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(text: 'Cutting'),
              Tab(text: 'Welding'),
              Tab(text: 'Kistler'),
              Tab(text: 'Bode'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TabAllViewScreen(),
                TabScreenCutter(),
                Center(child: Text('Content for Kister Tab')),
                Center(child: Text('Content for Bode Tab')),
              ],
            ),
          )
        ]));
  }
}
