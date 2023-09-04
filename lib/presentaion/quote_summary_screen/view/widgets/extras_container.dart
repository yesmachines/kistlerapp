import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/presentaion/price_screen/controller/price_screen_controller.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';
import 'package:provider/provider.dart';

// todo here is the container used for assessories container
class ExtrasQuoteContainer extends StatefulWidget {
  final VoidCallback onDelete;
  final ItemModel fittingsData;
  final int modelId;

  ExtrasQuoteContainer(
      {required this.onDelete,
      required this.fittingsData,
      required this.modelId});
  @override
  State<ExtrasQuoteContainer> createState() => _ExtrasQuoteContainerState();
}

class _ExtrasQuoteContainerState extends State<ExtrasQuoteContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .55,
                child: Text(
                  widget.fittingsData.title ?? "",
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              InkWell(
                onTap: widget.onDelete,
                child: Icon(
                  Icons.delete,
                  color: ColorConstant.kistlerBrandGreen,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
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
                        if (widget.fittingsData.quantity > 1) {
                          Provider.of<PriceScreenController>(context,
                                  listen: false)
                              .updateFittingQuantity(
                                  fittingId: widget.fittingsData.id,
                                  newQuantity: widget.fittingsData.quantity - 1,
                                  productId: widget.modelId);
                        }
                      },
                    ),
                    Text(
                      widget.fittingsData.quantity.toString(),
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
                            .updateFittingQuantity(
                                fittingId: widget.fittingsData.id,
                                newQuantity: widget.fittingsData.quantity + 1,
                                productId: widget.modelId);
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
                  Text(widget.fittingsData.price.toStringAsFixed(2).toString()),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
