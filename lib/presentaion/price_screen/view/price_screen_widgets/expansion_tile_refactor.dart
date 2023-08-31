import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/presentaion/price_screen/view/price_screen_widgets/custom_table_widget.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';

import '../../../../generated/locale_keys.g.dart';

class ExpansionTileRefactor extends StatefulWidget {
  final List<ItemModel> extrasList;
  final List<ItemModel> accessoriesList;
  final String tilenumber;
  final ProductModels productDetails;
  const ExpansionTileRefactor(
      {super.key,
      required this.extrasList,
      required this.accessoriesList,
      required this.tilenumber,
      required this.productDetails});

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
        backgroundColor: Color.fromARGB(255, 127, 193, 155),
        collapsedBackgroundColor: ColorConstant.kistlerBrandGreen,
        collapsedTextColor: ColorConstant.kistlerWhite,
        collapsedIconColor: ColorConstant.kistlerWhite,
        textColor: ColorConstant.kistlerWhite,
        iconColor: ColorConstant.kistlerWhite,
        title: Text(
          widget.productDetails.title ?? "N/a",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        leading: Text(widget.tilenumber),
        children: [
          Container(
            color: ColorConstant.kistlerWhite,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Basic machine with four quadrant control and reinforced drive for automatic welding. Designed for diameters from 25 mm up to 1000 mm. Height adjustment of the clamping arm is carried out by electric motor. Commands for rotary movement are set at an remote hand pendant Part number 800 601",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.product_price.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            "€ ${widget.productDetails.price?.toStringAsFixed(2) ?? "N/a"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: widget.extrasList.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.accessories.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
                SizedBox(height: 15),
                widget.extrasList.isNotEmpty
                    ? CustomTableWidget(
                        dataList: widget.extrasList,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 18,
                ),
                widget.accessoriesList.isNotEmpty
                    ? Text(
                        LocaleKeys.extra_fittings.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 18,
                ),
                widget.accessoriesList.isNotEmpty
                    ? CustomTableWidget(
                        dataList: widget.accessoriesList,
                      )
                    : SizedBox(),
              ],
            ),
          ),
          Container(
            color: ColorConstant.kistlerWhite,
            height: 18,
          ),
        ],
      ),
    );
  }
}
