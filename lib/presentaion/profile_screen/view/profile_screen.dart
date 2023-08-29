import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/profile_card.dart';
import 'package:kistler/presentaion/get_started_screen/view/get_started_screen.dart';
import 'package:kistler/presentaion/profile_update_screen/view/profile_update_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    Future<bool> logoutConfirmPopup() async {
      return await showDialog(
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(25),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
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
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetStartedScreen())),
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

    void _showProfileCard(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled:
            true, // This allows the content to take up the whole screen
        backgroundColor:
            Colors.transparent, // Set the background color to transparent
        builder: (context) {
          return Center(
            child: Container(
              width: 400.0, // Set the width to 400
              padding: EdgeInsets.all(16.0),
              child: ProfileCard(),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                SizedBox(height: 60),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileUpdateScreen()),
                              );
                            },
                            child: Icon(
                              Icons.save_as,
                              size: 30,
                              color: ColorConstant.kistlerBrandGreen,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            radius: 75,
                            backgroundColor: ColorConstant.kistlerBrandGreen,
                            child: CircleAvatar(
                                backgroundColor: ColorConstant.kistlerWhite,
                                radius: 72,
                                backgroundImage:
                                    AssetImage("assets/images/dp.png")),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              _showProfileCard(context);
                            },
                            child: Icon(
                              Icons.share,
                              size: 30,
                              color: ColorConstant.kistlerBrandGreen,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Felix Kistler",
                  style: TextStyle(
                      fontSize: 23,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.kistlerBrandGreen),
                ),
                Text(
                  "Marketing & Sales Management",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .80,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: ColorConstant.kistlerBrandGreen,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "+49 152 22972391",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .80,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail_outline_rounded,
                        color: ColorConstant.kistlerBrandGreen,
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .60,
                        child: Text(
                          "felix.kistler@kistler-machine.dsksjsjhjhe",
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              width: 200,
              color: ColorConstant.kistlerBrandGreen,
              child: Image.asset(
                "assets/images/QR1.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                logoutConfirmPopup();
              },
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: ColorConstant.kistlerBrandGreen,
                  ),
                  child: Center(
                      child: Text(
                    LocaleKeys.logout.tr(),
                    style: TextStyle(color: ColorConstant.kistlerWhite),
                  ))),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
