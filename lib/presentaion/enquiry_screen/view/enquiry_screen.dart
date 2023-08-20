import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';

import '../../../global_widgets/textfield_refactor.dart';

class Enquirycreen extends StatelessWidget {
  const Enquirycreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> showEnquirySumitPopup() async {
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
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavScreen())),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstant.kistlerBrandGreen),
                        child: Center(
                          child: Text(
                            LocaleKeys.back_to_home.tr(),
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

    return Scaffold(
      appBar: CustomAppBar(languageButtonVisibility: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  child: Container(
                    height: 180,
                    width: 180,
                    child: Image.network(
                      "https://imgs.search.brave.com/diuwAGp0a3Kc82mymdXgtdXUWi9BvTlMfBKEkqGQjLU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9oaXBz/LmhlYXJzdGFwcHMu/Y29tL3ZhZGVyLXBy/b2QuczMuYW1hem9u/YXdzLmNvbS8xNjc5/NTA3MjY2LXJ5b2Jp/LTY0MWIzZjNjOTEx/ODMuanBnP2Nyb3A9/MXh3OjF4aDtjZW50/ZXIsdG9wJnJlc2l6/ZT05ODA6Kg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Programmable Saddle Cutting Machines - SCM Series",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: ColorConstant.kistlerBrandGreen),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "PLC-Controlled",
                  style: TextStyle(
                      fontSize: 16, color: ColorConstant.kistlerTextColor),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(LocaleKeys.select_model.tr()),
                    ),
                    Container(
                      width: 30,
                      height: 35,
                      color: ColorConstant.kistlerBrandGreen,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorConstant.kistlerWhite,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextfieldRefactor(name: LocaleKeys.conpany_name.tr(), length: 1),
              SizedBox(
                height: 20,
              ),
              TextfieldRefactor(name: LocaleKeys.email_address.tr(), length: 1),
              SizedBox(
                height: 10,
              ),
              TextfieldRefactor(
                  name: LocaleKeys.contact_number.tr(), length: 1),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorConstant.kistlerBrandGreen),
                ),
                onPressed: () {
                  showEnquirySumitPopup();
                },
                child: Text(
                  LocaleKeys.submit.tr(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  LocaleKeys.t_and_c.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyle(fontSize: 14, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
