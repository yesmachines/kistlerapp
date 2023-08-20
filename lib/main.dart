import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kistler/generated/codegen_loader.g.dart';
import 'package:kistler/presentaion/splash_Screen/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
      runApp(EasyLocalization(
          path: 'assets/translations',
          supportedLocales: [
            const Locale('de'),
            const Locale('en'),
          ],
          assetLoader: const CodegenLoader(),
          fallbackLocale: const Locale('de'),
          useOnlyLangCode: true,
          child: const MyApp()));
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
    );
  }
}

//language changer class

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
