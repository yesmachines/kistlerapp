import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class ReusableLoadingIndicator extends StatelessWidget {
  const ReusableLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorConstant.kistlerBrandGreen,
      ),
    );
  }
}
