import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/presentaion/price_screen/controller/price_screen_controller.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/accessories_container.dart';
import 'package:kistler/presentaion/quote_summary_screen/view/widgets/assessories_container.dart';
import 'package:kistler/presentaion/quote_summary_screen/view/widgets/extras_container.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';
import 'package:provider/provider.dart';

class ModelsContainer extends StatefulWidget {
  final VoidCallback onDelete;
  final ProductModels modelData;

  ModelsContainer({required this.onDelete, required this.modelData});

  @override
  _ModelsContainerState createState() => _ModelsContainerState();
}

class _ModelsContainerState extends State<ModelsContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstant.kistlerBrandGreen),
          borderRadius: BorderRadius.circular(8),
          color: ColorConstant.kistlerBrandlightGreen,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: ColorConstant.kistlerBrandGreen.withOpacity(.1),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      widget.modelData.title ?? "",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  widget.modelData.isSelected
                      ? InkWell(
                          onTap: widget.onDelete,
                          child: Icon(
                            Icons.delete,
                            color: ColorConstant.kistlerBrandGreen,
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            widget.modelData.isSelected
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          color: ColorConstant.kistlerBrandGreen,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: ColorConstant.kistlerWhite,
                                ),
                                onPressed: () {
                                  if (widget.modelData.quantity > 0) {
                                    Provider.of<PriceScreenController>(context,
                                            listen: false)
                                        .updateQuantity(
                                            productId: widget.modelData.id,
                                            newQuantity:
                                                widget.modelData.quantity + 1);
                                  }
                                },
                              ),
                              Text(
                                widget.modelData.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorConstant.kistlerWhite,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: ColorConstant.kistlerWhite,
                                ),
                                onPressed: () {
                                  Provider.of<PriceScreenController>(context,
                                          listen: false)
                                      .updateQuantity(
                                          productId: widget.modelData.id,
                                          newQuantity:
                                              widget.modelData.quantity + 1);
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text("Price : "),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.euro,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(widget.modelData.price.toString()),
                          ],
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 15,
            ),
            widget.modelData.accessoriesList.any((e) => e.isSelected)
                ? Row(
                    children: [
                      Text(
                        LocaleKeys.Accessories.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: 10,
            ),
            for (final accessory in widget.modelData.accessoriesList)
              if (accessory.isSelected)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorConstant.kistlerBrandGreen),
                      borderRadius: BorderRadius.circular(8),
                      color: ColorConstant.kistlerWhite,
                    ),
                    child: AssessoriesQuoteContainer(
                      modelId: widget.modelData.id,
                      accessoryData: accessory,
                      onDelete: () {
                        if (accessory.isSelected) {
                          Provider.of<PriceScreenController>(context,
                                  listen: false)
                              .toggleAccessorySelection(
                                  accessoryId: accessory.id,
                                  productId: widget.modelData.id);
                          AppUtils.oneTimeSnackBar(
                            "${accessory.title} deleted from the cart",
                            context: context,
                          );
                        } else {
                          AppUtils.oneTimeSnackBar(
                            "${accessory.title} not found in cart ",
                            context: context,
                          );
                        }
                      },
                    ),
                  ),
                ),

            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: ColorConstant.kistlerBrandGreen),
            //     borderRadius: BorderRadius.circular(8),
            //     color: ColorConstant.kistlerBrandlightGreen,
            //   ),
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: widget.modelData.accessoriesList.length,
            //     itemBuilder: (context, index) => AssessoriesQuoteContainer(),
            //   ),
            // ),
            widget.modelData.extrasList.any((e) => e.isSelected)
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.extra_fittings.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            for (final fitting in widget.modelData.extrasList)
              if (fitting.isSelected)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorConstant.kistlerBrandGreen),
                      borderRadius: BorderRadius.circular(8),
                      color: ColorConstant.kistlerWhite,
                    ),
                    child: ExtrasQuoteContainer(
                      modelId: widget.modelData.id,
                      fittingsData: fitting,
                      onDelete: () {
                        if (fitting.isSelected) {
                          Provider.of<PriceScreenController>(context,
                                  listen: false)
                              .toggleFittingSelection(
                                  fittingId: fitting.id,
                                  productId: widget.modelData.id);
                          AppUtils.oneTimeSnackBar(
                            "${fitting.title} deleted from the cart",
                            context: context,
                          );
                        } else {
                          AppUtils.oneTimeSnackBar(
                            "${fitting.title} not found in cart ",
                            context: context,
                          );
                        }
                      },
                    ),
                  ),
                ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: ColorConstant.kistlerBrandGreen),
            //     borderRadius: BorderRadius.circular(8),
            //     color: ColorConstant.kistlerBrandlightGreen,
            //   ),
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: widget.modelData.extrasList.length,
            //     itemBuilder: (context, index) => ExtrasQuoteContainer(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
