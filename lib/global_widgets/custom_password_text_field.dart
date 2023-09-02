import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField({
    super.key,
    this.controller,
    this.formKey,
    this.obscureText = false,
    this.onPassVisibilityPressed,
    this.titleText,
  });

  final TextEditingController? controller;
  final Key? formKey;
  final bool obscureText;
  final VoidCallback? onPassVisibilityPressed;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              titleText ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: controller,
                obscureText: !obscureText,
                decoration: InputDecoration(
                  //  isDense: true,
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstant.kistlerBrandGreen),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.kistlerBrandGreen)),

                  labelStyle:
                      TextStyle(color: ColorConstant.kistlerBrandBorder),
                  alignLabelWithHint: true,

                  focusColor: ColorConstant.kistlerBrandGreen,
                  suffixIcon: IconButton(
                    icon: Icon(
                      !obscureText ? Icons.visibility : Icons.visibility_off,
                      color: ColorConstant.kistlerBrandGreen,
                    ),
                    onPressed: onPassVisibilityPressed,
                  ),

                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstant.kistlerBrandGreen),
                  ),

                  //  focusedBorder: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length >= 8) {
                    return null;
                  } else {
                    return "Password must contain 8 character";
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
