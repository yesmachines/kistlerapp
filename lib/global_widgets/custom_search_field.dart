import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/presentaion/search_screen/controller/search_screen_controller.dart';
import 'package:kistler/presentaion/search_screen/view/search_screen.dart';
import 'package:provider/provider.dart';

class CustomSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: ColorConstant.kistlerBrandBorder)),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                            create: (context) => SearchScreenController(),
                            child: SearchScreen(),
                          ))),
              child: Container(
                padding: EdgeInsets.all(6),
                // color: Colors.amber,
                child: Text(
                  LocaleKeys.search.tr(),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConstant.kistlerBrandGreen,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: MediaQuery.of(context).size.height,
            width: 55,
            child: Icon(
              Icons.search,
              color: ColorConstant.kistlerWhite,
            ),
          ),
        ],
      ),
    );
  }
}
