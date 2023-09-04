import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/search_screen/controller/search_screen_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart/color.dart';
import '../../../generated/locale_keys.g.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.kistlerWhite,
      appBar: CustomAppBar(languageButtonVisibility: false),
      body: Column(
        children: [
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
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border:
                          Border.all(color: ColorConstant.kistlerBrandBorder)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.search.tr(),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                          onChanged: (value) {
                            Provider.of<SearchScreenController>(context,
                                    listen: false)
                                .getSearchData(
                                    language: context.locale,
                                    searchText: value);
                          },
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
