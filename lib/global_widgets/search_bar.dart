import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';

class SearchBarRefactor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: ColorConstant.kistlerBrandBorder)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: LocaleKeys.search.tr(),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
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
