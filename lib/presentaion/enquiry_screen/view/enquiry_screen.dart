import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/enquiry_screen/controller/enquiryScreenController.dart';
import 'package:provider/provider.dart';

import '../../../core/app_utils/app_utils.dart';
import '../../../global_widgets/reusable_loading_widget.dart';
import '../../../global_widgets/textfield_refactor.dart';

class Enquirycreen extends StatefulWidget {
  final String url;
  final String productName;
  const Enquirycreen({super.key, required this.url, required this.productName});

  @override
  State<Enquirycreen> createState() => _EnquirycreenState();
}

class _EnquirycreenState extends State<Enquirycreen> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
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
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      // onTap: () => Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BottomNavScreen())),
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

    final provider = Provider.of<EnquiryScreenController>(context);
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
                    child: Center(
                        child: CommonImageView(
                      url: widget.url,
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  widget.productName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: ColorConstant.kistlerBrandGreen),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Text(
              //     "PLC-Controlled",
              //     style: TextStyle(
              //         fontSize: 14, color: ColorConstant.kistlerTextColor),
              //   ),
              // ),
              // SizedBox(
              //   height: 18,
              // ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  //  isDense: true,
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.kistlerBrandGreen),
                      borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.kistlerBrandGreen)),
                  hintText: widget.productName,
                  enabled: false,

                  labelStyle: TextStyle(color: ColorConstant.kistlerBrandGreen),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstant.kistlerBrandGreen),
                  ),
                  //  focusedBorder: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextfieldRefactor(
                  controller: companyNameController,
                  name: LocaleKeys.conpany_name.tr(),
                  length: 1),
              SizedBox(
                height: 20,
              ),
              TextfieldRefactor(
                  controller: emailAddressController,
                  name: LocaleKeys.email_address.tr(),
                  length: 1),
              SizedBox(
                height: 10,
              ),
              TextfieldRefactor(
                  controller: contactNumberController,
                  name: LocaleKeys.contact_number.tr(),
                  length: 1),
              SizedBox(
                height: 20,
              ),
              provider.isLoading
                  ? ReusableLoadingIndicator()
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            ColorConstant.kistlerBrandGreen),
                      ),
                      onPressed: () {
                        Provider.of<EnquiryScreenController>(context,
                                listen: false)
                            .onEnquirySend(
                                language: context.locale,
                                modelName: widget.productName,
                                name: companyNameController.text,
                                email: emailAddressController.text,
                                phoneNumber: contactNumberController.text)
                            .then((value) {
                          if (value) {
                            AppUtils.oneTimeSnackBar(
                                "Profile updated successfully",
                                context: context,
                                bgColor: ColorConstant.kistlerBrandGreen);
                            // calling api to update user  data on profile screen
                            Provider.of<EnquiryScreenController>(context,
                                    listen: false)
                                .onEnquirySend(
                              language: context.locale,
                            );
                            Navigator.pop(context);
                          } else {
                            // showing error message if failed to update data
                            AppUtils.oneTimeSnackBar(provider.errorMessage,
                                context: context);
                          }
                        });
                        // showEnquirySumitPopup();
                      },
                      child: Text(
                        LocaleKeys.submit.tr(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     LocaleKeys.t_and_c.tr(),
              //     style: TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              //   style: TextStyle(fontSize: 14, height: 1.5),
              //   textAlign: TextAlign.justify,
              // ),
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
