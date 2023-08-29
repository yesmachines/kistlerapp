import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class TextfieldRefactor extends StatelessWidget {
  final String name;
  final int length;
  final Key? formKey;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextfieldRefactor(
      {super.key,
      required this.name,
      required this.length,
      this.formKey,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          //  isDense: true,
          contentPadding: EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.kistlerBrandGreen),
              borderRadius: BorderRadius.circular(6)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.kistlerBrandGreen)),
          labelText: name, alignLabelWithHint: true,
          labelStyle: TextStyle(color: ColorConstant.kistlerBrandGreen),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.kistlerBrandGreen),
          ),
          //  focusedBorder: OutlineInputBorder()
        ),
        maxLines: length,
        validator: validator,
      ),
    );
  }
}
