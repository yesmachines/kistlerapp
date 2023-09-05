import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/core/image_constant/images.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';

import 'package:kistler/presentaion/get_started_screen/view/get_started_screen.dart';
import 'package:kistler/presentaion/no_internet_screen/view/no_internet_screen.dart';
import 'package:kistler/presentaion/splash_Screen/controller/common_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.setLocale(Locale('de'));
    });

    super.initState();

    Future.delayed(Duration(seconds: 3), () async {
      if (await AppUtils.isOnline()) {
        final String? savedToken = await AppUtils.getAccessKey();

        if (savedToken != null && savedToken.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => GetStartedScreen()),
          );
        }
      } else {
        if (mounted) {
          await AppUtils.oneTimeSnackBar(LocaleKeys.No_internet_connection.tr(),
              context: CommonController.navigatorState.currentContext!);
        }

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NoInternetScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 100,
            width: 100,
            child: Image.asset(
              ImageConstant.smallLogo,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
