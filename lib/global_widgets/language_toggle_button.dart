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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
          FlutterToggleTab(
        width: 15, // width in percent
        borderRadius: 30,
        height: 25,
        selectedIndex: 1,
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
          setState(() {});
        },
        isScroll: false,
      ),
    );
  }
}
