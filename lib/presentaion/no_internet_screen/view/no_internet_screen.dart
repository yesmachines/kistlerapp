import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/presentaion/splash_Screen/view/splash_screen.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Lottie.asset(
                'assets/lottie_files/no_internet_3.json',
                repeat: true,
              ),
            ),
            Text(
              LocaleKeys.No_internet_connection.tr(),
              style: TextStyle(
                  color: ColorConstant.kistlerBrandGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                    (route) => false);
              },
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: ColorConstant.kistlerBrandGreen,
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.refresh_rounded,
                        color: ColorConstant.kistlerWhite,
                        size: 25,
                      ),
                      SizedBox(width: 20),
                      Text(
                        LocaleKeys.retry.tr(),
                        style: TextStyle(
                            color: ColorConstant.kistlerWhite, fontSize: 20),
                      ),
                    ],
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
