import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/app_utils/app_utils.dart';

import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';

import 'package:kistler/global_widgets/textfield_refactor.dart';
import 'package:kistler/presentaion/price_screen/controller/price_screen_controller.dart';
import 'package:kistler/presentaion/quote_summary_screen/controller/quote_summary_screen_controller.dart';
import 'package:kistler/presentaion/quote_summary_screen/view/widgets/models_container.dart';
import 'package:provider/provider.dart';

import '../../../global_widgets/reusable_loading_widget.dart';

class QuoteSummaryScreen extends StatefulWidget {
  final String productId;

  const QuoteSummaryScreen({super.key, required this.productId});

  @override
  State<QuoteSummaryScreen> createState() => _QuoteSummaryScreenState();
}

class _QuoteSummaryScreenState extends State<QuoteSummaryScreen> {
  final contactNumberFormKey = GlobalKey<FormState>();
  final companyNameFormKey = GlobalKey<FormState>();
  final emailAddressFormKey = GlobalKey<FormState>();
  final contactNameFormKey = GlobalKey<FormState>();
  final productNameFormKey = GlobalKey<FormState>();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PriceScreenController>(context);

    Future<bool> showExitPopup() async {
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
                  LocaleKeys.quotation_req_sucess.tr(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavScreen()),
                          (route) => false),
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              color: ColorConstant.kistlerBrandGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.edit_Quotation.tr(),
                    style: TextStyle(
                        fontSize: 16, color: ColorConstant.kistlerWhite),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.edit_note_rounded),
                    color: ColorConstant.kistlerWhite,
                  )
                ],
              ),
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                LocaleKeys.quotation_summary.tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Color.fromARGB(255, 237, 237, 237),
              thickness: 8,
            ),
            ...[
              for (final model in provider.modelsList)
                if (model.isSelected ||
                    model.accessoriesList.any((a) => a.isSelected) ||
                    model.extrasList.any((f) => f.isSelected))
                  ModelsContainer(
                    modelData: model,
                    onDelete: () {
                      if (model.isSelected) {
                        Provider.of<PriceScreenController>(context,
                                listen: false)
                            .toggleSelection(model.id);
                        AppUtils.oneTimeSnackBar(
                          "${model.title} ${LocaleKeys.deleted_from_the_cart.tr()}",
                          context: context,
                        );
                      } else {
                        AppUtils.oneTimeSnackBar(
                          "${model.title} ${LocaleKeys.not_found_in_cart.tr()}",
                          context: context,
                        );
                      }
                    },
                  ),
            ],

            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: 2,
            //   itemBuilder: (context, index) => ModelsContainer(
            //     modelData: provider.modelsList[index],
            //     initialValue: 1,
            //     onChanged: (value) {
            //       print('Quantity changed: $value');
            //     },
            //   ),
            //   separatorBuilder: (context, index) => Divider(
            //     color: Color.fromARGB(255, 237, 237, 237),
            //     thickness: 8,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    LocaleKeys.Customer_Details.tr(),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextfieldRefactor(
                    formKey: contactNameFormKey,
                    controller: contactNameController,
                    name: LocaleKeys.contact_name.tr(),
                    maxLines: 1,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return LocaleKeys.Enter_your_name.tr();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldRefactor(
                    formKey: companyNameFormKey,
                    controller: companyNameController,
                    name: LocaleKeys.conpany_name.tr(),
                    maxLines: 1,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return LocaleKeys.Enter_your_company_name.tr();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldRefactor(
                    formKey: emailAddressFormKey,
                    controller: emailAddressController,
                    name: LocaleKeys.email_address.tr(),
                    maxLines: 1,
                    validator: (value) {
                      if (value != null &&
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return null;
                      } else {
                        return LocaleKeys.Enter_a_valid_email_address.tr();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldRefactor(
                    formKey: contactNumberFormKey,
                    controller: contactNumberController,
                    inputType: true,
                    name: LocaleKeys.contact_number.tr(),
                    maxLines: 1,
                    validator: (value) {
                      if (value != null &&
                          RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                              .hasMatch(value)) {
                        return null;
                      } else {
                        return LocaleKeys.Enter_a_valid_Contact_number.tr();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextfieldRefactor(
                      controller: commentsController,
                      name: LocaleKeys.comment.tr(),
                      maxLines: 5),
                  SizedBox(
                    height: 40,
                  ),
                  provider.isLoading
                      ? ReusableLoadingIndicator()
                      : InkWell(
                          onTap: () async {
                            if (contactNameFormKey.currentState!.validate() &&
                                companyNameFormKey.currentState!.validate() &&
                                emailAddressFormKey.currentState!.validate() &&
                                contactNumberFormKey.currentState!.validate()) {
                              await Provider.of<
                                          QuotationSummaryScreenController>(
                                      context,
                                      listen: false)
                                  .sendQuotation(
                                      language: context.locale,
                                      productId: widget.productId,
                                      companyName:
                                          companyNameController.text.trim(),
                                      name: contactNameController.text.trim(),
                                      comment: commentsController.text.trim(),
                                      email: emailAddressController.text.trim(),
                                      phoneNumber:
                                          contactNumberController.text.trim(),
                                      quptationData:
                                          provider.generateJsonData())
                                  .then((value) {
                                if (value) {
                                  provider.generateJsonData();
                                } else {
                                  AppUtils.oneTimeSnackBar(
                                      LocaleKeys.Failed_to_send_quotation.tr(),
                                      context: context);
                                }
                              });

                              // showExitPopup();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 50, bottom: 20, right: 50),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.kistlerBrandGreen,
                              ),
                              child: Center(
                                  child: Text(
                                LocaleKeys.send_quotation.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: ColorConstant.kistlerWhite),
                              )),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
