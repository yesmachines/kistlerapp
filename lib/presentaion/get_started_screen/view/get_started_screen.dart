import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/core/image_constant/images.dart';
import 'package:kistler/generated/locale_keys.g.dart';

import '../../bottom_nav_screen/view/bottom_nav_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Container(
              width: MediaQuery.of(context).size.width * .60,
              child: Image.asset(
                ImageConstant.kistlerLogo,
                fit: BoxFit.fitWidth,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen()),
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstant.kistlerBrandGreen,
                ),
                child: Center(
                  child: Text(
                    LocaleKeys.get_started.tr(),
                    style: TextStyle(
                        color: ColorConstant.kistlerWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
