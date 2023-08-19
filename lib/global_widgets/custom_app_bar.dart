import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/language_toggle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstant.kistlerWhite,
      leadingWidth: 150,
      leading: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorConstant.kistlerBrandGreen,
              )),
          LanguageToggleButton()
        ],
      ),
      actions: [
        Container(
            height: 20,
            width: 160,
            child: Image.asset("assets/images/logo.png")),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
