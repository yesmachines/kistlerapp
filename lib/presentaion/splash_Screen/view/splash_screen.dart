import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/core/image_constant/images.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';

import 'package:kistler/presentaion/get_started_screen/view/get_started_screen.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
              height: 100,
              width: 100,
              child: Image.asset(
                ImageConstant.smallLogo,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
