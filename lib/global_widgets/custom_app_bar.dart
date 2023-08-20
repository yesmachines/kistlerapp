import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/core/image_constant/images.dart';
import 'package:kistler/global_widgets/language_toggle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.languageButtonVisibility = true,
      this.backButtonVisibility = true});
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  final bool languageButtonVisibility;
  final bool backButtonVisibility;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstant.kistlerWhite,
      leadingWidth: 150,
      leading: Row(
        children: [
          backButtonVisibility
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.kistlerBrandGreen,
                  ))
              : SizedBox(
                  width: 20,
                ),
          languageButtonVisibility ? LanguageToggleButton() : SizedBox()
        ],
      ),
      actions: [
        Container(
            height: 20,
            width: 140,
            child: Image.asset(
              ImageConstant.kistlerLogo,
              fit: BoxFit.fitWidth,
            )),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
