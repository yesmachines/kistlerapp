import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:kistler/core/constants.dart/color.dart';

class LanguageToggleButton extends StatefulWidget {
  const LanguageToggleButton({super.key});

  @override
  State<LanguageToggleButton> createState() => _LanguageToggleButtonState();
}

class _LanguageToggleButtonState extends State<LanguageToggleButton> {
  List<String> get _listTextTabToggle => ["De", "En"];
  int selectedIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.locale == Locale('de')) {
        selectedIndex = 0;
        setState(() {});
      } else {
        selectedIndex = 1;

        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
          FlutterToggleTab(
        width: 15, // width in percent
        borderRadius: 30,
        height: 25,
        selectedIndex: selectedIndex,
        selectedBackgroundColors: [
          ColorConstant.kistlerBrandGreen,
          ColorConstant.kistlerBrandGreen,
        ],
        selectedTextStyle: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
        unSelectedTextStyle: TextStyle(
            color: Colors.black87, fontSize: 10, fontWeight: FontWeight.w500),
        labels: _listTextTabToggle,
        selectedLabelIndex: (index) {
          selectedIndex = index;
          if (selectedIndex == 1) {
            context.setLocale(Locale('en'));
            print("language updated to ${Locale('en')}");

            setState(() {});
          } else {
            context.setLocale(Locale('de'));

            print("language updated to ${Locale('de')}");
            setState(() {});
          }
        },
        isScroll: false,
      ),
    );
  }
}
