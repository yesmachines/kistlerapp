import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';

class AccessoriesContainer extends StatelessWidget {
  const AccessoriesContainer({super.key, required this.accessoryData});
  final ProductAccessory? accessoryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            // BoxShadow(
            //     blurRadius: 6,
            //     color: ColorConstant.kistlerTextBlack.withOpacity(.08),
            //     offset: Offset(0, 6))
          ],
          border: Border.all(),
          color: ColorConstant.kistlerWhite),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          "${accessoryData?.tAccessTitle ?? "N/a"} ${accessoryData?.tAccessDescription ?? "N/a"}",
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
