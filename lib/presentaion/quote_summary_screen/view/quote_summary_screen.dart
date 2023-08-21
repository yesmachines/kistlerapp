import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';

import 'package:kistler/global_widgets/textfield_refactor.dart';
import 'package:kistler/presentaion/quote_summary_screen/view/quote_screen_widgets/table_row_refactor.dart';

class QuoteSummaryScreen extends StatefulWidget {
  const QuoteSummaryScreen({super.key});

  @override
  State<QuoteSummaryScreen> createState() => _QuoteSummaryScreenState();
}

class _QuoteSummaryScreenState extends State<QuoteSummaryScreen> {
  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  LocaleKeys.quotation_summary.tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // here is calling the refactored table for the summary
              TableRowRefactor(),
              const SizedBox(height: 15),
              Table(
                border: TableBorder.all(color: ColorConstant.kistlerBrandGreen),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FlexColumnWidth(3.5),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          LocaleKeys.total.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        '\$ 35 710',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    LocaleKeys.Customer_Details.tr(),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextfieldRefactor(name: LocaleKeys.contact_name.tr(), length: 1),
              SizedBox(
                height: 10,
              ),
              TextfieldRefactor(name: LocaleKeys.conpany_name.tr(), length: 1),
              SizedBox(
                height: 10,
              ),
              TextfieldRefactor(name: LocaleKeys.email_address.tr(), length: 1),
              SizedBox(
                height: 10,
              ),
              TextfieldRefactor(
                  name: LocaleKeys.contact_number.tr(), length: 1),
              SizedBox(
                height: 10,
              ),
              TextfieldRefactor(name: LocaleKeys.comment.tr(), length: 5),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  showExitPopup();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50, bottom: 20, right: 50),
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
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
