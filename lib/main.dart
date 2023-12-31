import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/codegen_loader.g.dart';
import 'package:kistler/presentaion/custom_made_solution_screen/controller/custom_made_screen_controller.dart';

import 'package:kistler/presentaion/enquiry_screen/controller/enquiryScreenController.dart';
import 'package:kistler/presentaion/login_screen/controller/login_screen_controller.dart';

import 'package:kistler/presentaion/quote_summary_screen/controller/quote_summary_screen_controller.dart';
import 'package:kistler/presentaion/splash_Screen/controller/common_controller.dart';
import 'package:kistler/presentaion/splash_Screen/view/splash_screen.dart';
import 'package:provider/provider.dart';

import 'presentaion/categories_screen/controller/categories_screen_controller.dart';
import 'presentaion/price_screen/controller/price_screen_controller.dart';

import 'presentaion/profile_screen/controller/profile_screen_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
      runApp(
        EasyLocalization(
          path: 'assets/translations',
          supportedLocales: [
            const Locale('de'),
            const Locale('en'),
          ],
          assetLoader: const CodegenLoader(),
          fallbackLocale: const Locale('de'),
          useOnlyLangCode: true,
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenController()),
        ChangeNotifierProvider(
            create: (context) => CategoriesScreenController()),
        ChangeNotifierProvider(create: (context) => ProfileScreenController()),
        // ChangeNotifierProvider(
        //     create: (context) => ProfileUpdateScreenController()),
        // ChangeNotifierProvider(
        //     create: (context) => ProductDetailsScreenController()),
        ChangeNotifierProvider(create: (context) => PriceScreenController()),
        ChangeNotifierProvider(create: (context) => EnquiryScreenController()),
        ChangeNotifierProvider(
            create: (context) => CustomMadeScreenController()),
        ChangeNotifierProvider(
            create: (context) => QuotationSummaryScreenController()),
      ],
      child: MaterialApp(
        navigatorKey: CommonController.navigatorState,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: ColorConstant.kistlerWhite),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
      ),
    );
  }
}

//   Language Changer Class
//
//
// class LocalisationChecker {
//   static changeLanguage(BuildContext context) {
//     Locale? currentLocalle = EasyLocalization.of(context)!.currentLocale;
//     if (currentLocalle == const Locale('en')) {
//       EasyLocalization.of(context)!.setLocale(Locale('de'));
//       // Phoenix.rebirth(context);
//     } else {
//       EasyLocalization.of(context)!.setLocale(Locale('en'));
//       // Phoenix.rebirth(context);
//     }
//   }
// }
