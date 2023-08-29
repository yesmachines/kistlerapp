import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/repository/helper_fucntions/helper_functions.dart';

Future<bool> logoutConfirmPopup({required BuildContext context}) async {
  return await showDialog(
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(25),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: CircleAvatar(
              radius: 24,
              backgroundColor: ColorConstant.kistlerBrandGreen,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.logout,
                  size: 25,
                  color: ColorConstant.kistlerBrandGreen,
                ),
              ),
            ),
            content: Text(
              // this is the one that actually works
              LocaleKeys.want_to_logout.tr(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: ColorConstant.kistlerBrandGreen),
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.no.tr(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorConstant.kistlerBrandGreen),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => HelperFunctions.logOut(context),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstant.kistlerBrandGreen),
                        child: Center(
                          child: Text(
                            LocaleKeys.yes.tr(),
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
                    width: 20,
                  ),
                ],
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
