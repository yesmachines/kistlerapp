import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/presentaion/get_started_screen/view/get_started_screen.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

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
                  'Do you want to Logout',
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
                                "No",
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
                                "Yes",
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

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(),
                Row(
                  children: [
                    Icon(
                      Icons.save_as,
                      size: 30,
                      color: ColorConstant.kistlerBrandGreen,
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
                        backgroundImage: NetworkImage(
                            "https://imgs.search.brave.com/NY3q4iDdSa0W_vEw16mKYGZk5hcoC1HeBYjN7k89hD4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS53aXJlZC5jb20v/cGhvdG9zLzY0OWM3/NjU3NjI3OWUzNjQ3/Mjg0NDY0Ni8zOjIv/d18xMjgwLGNfbGlt/aXQvRWxvbi1NdXNr/LVZpdmF0ZWNoLUJ1/c2luZXNzLTE0OTkw/MTMxMDIuanBn"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.share,
                      size: 30,
                      color: ColorConstant.kistlerBrandGreen,
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
                    fontSize: 30,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.kistlerBrandGreen),
              ),
              Text(
                "Marketing & Sales Management",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: ColorConstant.kistlerBrandGreen),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.message, color: ColorConstant.kistlerBrandGreen)
                ],
              ),
            ],
          ),
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
    );
  }
}
