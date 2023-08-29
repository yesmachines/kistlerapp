import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';

import '../../../global_widgets/search_bar.dart';
import '../../../global_widgets/textfield_refactor.dart';

class CustomMadeSolutionScreen extends StatefulWidget {
  const CustomMadeSolutionScreen({super.key});

  @override
  State<CustomMadeSolutionScreen> createState() =>
      _CustomMadeSolutionScreenState();
}

class _CustomMadeSolutionScreenState extends State<CustomMadeSolutionScreen> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController contactNumbercontroller = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();

  @override
  void dispose() {
    companyNameController.dispose();
    contactNumbercontroller.dispose();
    emailAddressController.dispose();
    contactNameController.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    countryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> customMadeSumitPopup() async {
      return await showDialog(
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(25),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: CircleAvatar(
                  radius: 22,
                  backgroundColor: ColorConstant.kistlerBrandGreen,
                  child: Icon(
                    Icons.done,
                  ),
                ),
                content: Text(
                  // this is the one that actually works
                  LocaleKeys.tank_you.tr(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstant.kistlerBrandGreen),
                        child: Center(
                          child: Text(
                            LocaleKeys.back.tr(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return Column(
      children: [
        // Container(
        //   decoration:
        //       BoxDecoration(color: ColorConstant.kistlerWhite, boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(.1),
        //       blurRadius: 10,
        //       offset: Offset(1, 3),
        //     ),
        //   ]),
        //   height: 70,
        //   child: Center(
        //     child: Container(
        //       height: 45,
        //       width: MediaQuery.of(context).size.width * .80,
        //       child: SearchBarRefactor(),
        //     ),
        //   ),
        // ),
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
                        color: ColorConstant.kistlerTextBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
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
                    controller: companyNameController,
                    name: LocaleKeys.conpany_name.tr(),
                    length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    controller: contactNameController,
                    name: LocaleKeys.contact_name.tr(),
                    length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    controller: emailAddressController,
                    name: LocaleKeys.email_address.tr(),
                    length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    controller: contactNumbercontroller,
                    name: LocaleKeys.contact_number.tr(),
                    length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    controller: countryNameController,
                    name: LocaleKeys.country_name.tr(),
                    length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                    controller: productNameController,
                    name: LocaleKeys.product_name.tr(),
                    length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(
                  controller: descriptionController,
                  name: LocaleKeys.description.tr(),
                  length: 5,
                ),
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.kistlerBrandGreen,
                    ),
                    onPressed: () {
                      customMadeSumitPopup();
                    },
                    child: Text(
                      //  LocaleKeys.submit.tr(),
                      LocaleKeys.submit.tr(),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                // Text(
                //   LocaleKeys.about_company_data.tr(),
                //   style: TextStyle(fontSize: 14, height: 2),
                //   textAlign: TextAlign.left,
                // ),
                // SizedBox(height: 25),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
