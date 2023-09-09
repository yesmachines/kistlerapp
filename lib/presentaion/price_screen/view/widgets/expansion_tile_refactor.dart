import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/presentaion/price_screen/controller/price_screen_controller.dart';
import 'package:kistler/presentaion/price_screen/view/widgets/custom_extras_table_widget.dart';
import 'package:kistler/presentaion/price_screen/view/widgets/custom_accessories_table_widget.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';
import 'package:provider/provider.dart';

import '../../../../generated/locale_keys.g.dart';

class ExpansionTileRefactor extends StatefulWidget {
  final List<ItemModel> extrasList;
  final List<ItemModel> accessoriesList;
  final String tilenumber;
  final String modelDescription;

  final ProductModels modelDetails;
  const ExpansionTileRefactor(
      {super.key,
      required this.extrasList,
      required this.accessoriesList,
      required this.tilenumber,
      required this.modelDetails,
      required this.modelDescription});

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
          widget.modelDetails.title ?? "N/a",
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
                      widget.modelDescription,
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
                            "€ ${widget.modelDetails.price?.toStringAsFixed(2) ?? "N/a"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Checkbox(
                              activeColor: ColorConstant.kistlerBrandGreen,
                              value: widget.modelDetails.isSelected,
                              onChanged: (value) {
                                Provider.of<PriceScreenController>(context,
                                        listen: false)
                                    .toggleSelection(widget.modelDetails.id);
                              })
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: widget.accessoriesList.isNotEmpty
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
                widget.accessoriesList.isNotEmpty
                    ? CustomAccessoriesTableWidget(
                        productId: widget.modelDetails.id,
                        dataList: widget.accessoriesList,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 18,
                ),
                widget.extrasList.isNotEmpty
                    ? Text(
                        LocaleKeys.extra_charge_for_parts.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 18,
                ),
                widget.extrasList.isNotEmpty
                    ? CustomExtrasTableWidget(
                        productId: widget.modelDetails.id,
                        extraFittingsDataList: widget.extrasList,
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
