import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class TextfieldRefactor extends StatelessWidget {
  final String name;
  final int length;
  const TextfieldRefactor(
      {super.key, required this.name, required this.length});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        //  isDense: true,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorConstant.kistlerBrandGreen),
            borderRadius: BorderRadius.circular(6)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorConstant.kistlerBrandGreen)),
        labelText: name, alignLabelWithHint: true,
        labelStyle: TextStyle(color: colorConstant.kistlerBrandGreen),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorConstant.kistlerBrandGreen),
        ),
        //  focusedBorder: OutlineInputBorder()
      ),
      maxLines: length,
    );
  }
}
