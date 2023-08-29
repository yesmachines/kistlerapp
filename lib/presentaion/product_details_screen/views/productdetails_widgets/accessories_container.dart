import 'package:flutter/material.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';

class AccessoriesContainer extends StatelessWidget {
  const AccessoriesContainer({super.key, required this.accessoryData});
  final ProductAccessory? accessoryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
                "${accessoryData?.tAccessTitle ?? "N/a"} ${accessoryData?.tAccessDescription ?? "N/a"}"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
