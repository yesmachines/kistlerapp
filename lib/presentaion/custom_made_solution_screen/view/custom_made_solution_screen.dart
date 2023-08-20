import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/presentaion/home_screen/view/home_screen.dart';

import '../../../global_widgets/search_bar.dart';
import 'custom_screen_widgets/custom_widget.dart';

class CustomMadeSolutionScreen extends StatefulWidget {
  const CustomMadeSolutionScreen({super.key});

  @override
  State<CustomMadeSolutionScreen> createState() =>
      _CustomMadeSolutionScreenState();
}

class _CustomMadeSolutionScreenState extends State<CustomMadeSolutionScreen> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controller6 = TextEditingController();
  TextEditingController _controller7 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(color: ColorConstant.kistlerWhite, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: Offset(1, 3),
            ),
          ]),
          height: 70,
          child: Center(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * .80,
              child: SearchBarRefactor(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    LocaleKeys.custom_made_solution.tr(),
                    style: TextStyle(
                        color: ColorConstant.kistlerTextBlack, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  LocaleKeys.find_the_solution_with_us.tr(),
                  style: TextStyle(
                      color: ColorConstant.kistlerTextBlack, fontSize: 16),
                ),
                SizedBox(height: 10),
                TextfieldRefactor(
                    name: LocaleKeys.conpany_name.tr(), length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    name: LocaleKeys.contact_name.tr(), length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    name: LocaleKeys.email_address.tr(), length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    name: LocaleKeys.contact_number.tr(), length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    name: LocaleKeys.country_name.tr(), length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    name: LocaleKeys.product_name.tr(), length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(name: LocaleKeys.description.tr(), length: 5),
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.submit.tr(),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  LocaleKeys.about_company_data.tr(),
                  style: TextStyle(fontSize: 14, height: 2),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
