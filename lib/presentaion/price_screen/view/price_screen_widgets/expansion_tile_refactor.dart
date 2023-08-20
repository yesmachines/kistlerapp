import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/presentaion/price_screen/view/price_screen_widgets/tables.dart';

import '../../../../generated/locale_keys.g.dart';

class ExpansionTileRefactor extends StatefulWidget {
  final List<Map<dynamic, dynamic>> data;
  final List<Map<dynamic, dynamic>> assdata;
  final String tilenumber;
  final String tileName;
  const ExpansionTileRefactor(
      {super.key,
      required this.data,
      required this.assdata,
      required this.tilenumber,
      required this.tileName});

  @override
  State<ExpansionTileRefactor> createState() => _ExpansionTileRefactorState();
}

class _ExpansionTileRefactorState extends State<ExpansionTileRefactor> {
  int selectedNumber = 1;
  bool? checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: ColorConstant.kistlerBrandGreen,
        collapsedTextColor: ColorConstant.kistlerWhite,
        collapsedIconColor: ColorConstant.kistlerWhite,
        textColor: ColorConstant.kistlerBrandGreen,
        iconColor: ColorConstant.kistlerBrandGreen,
        title: Row(
          children: [
            Text(widget.tilenumber),
            VerticalDivider(
              thickness: 3,
              color: Colors.white,
            ),
            Text(
              widget.tileName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.product_price.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Row(
                  children: [
                    Text("\$ 3500",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                        activeColor: ColorConstant.kistlerBrandGreen,
                        value: checkValue,
                        onChanged: (value) {
                          setState(() {
                            checkValue = value;
                          });
                        })
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.product_qty.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                DropdownButton<int>(
                  value: selectedNumber,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedNumber = newValue!;
                    });
                  },
                  items: List.generate(100, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text((index + 1).toString()),
                    );
                  }),
                ),
              ],
            ),
          ),
          PriceScreenTable(
            data: widget.data,
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            LocaleKeys.accessories.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 18,
          ),
          PriceScreenTable(
            data: widget.assdata,
          ),
        ],
      ),
    );
  }
}
