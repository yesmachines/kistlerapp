import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: 100,
                            child: Image.asset(
                              "assets/images/logo_sub.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Felix Kistler",
                    style: TextStyle(
                        color: ColorConstant.kistlerBrandGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 240,
                    child: Text(
                      "Business Development Management Kistler Cutting and Welding Techniques",
                      style: TextStyle(
                          color: ColorConstant.kistlerBrandGreen,
                          fontSize: 11,
                          wordSpacing: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: ColorConstant.kistlerBrandGreen,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "+49 152 22972391",
                        style: TextStyle(
                            color: ColorConstant.kistlerBrandGreen,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: ColorConstant.kistlerBrandGreen,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "felix.kistler@kistler-machine.de",
                        style: TextStyle(
                            color: ColorConstant.kistlerBrandGreen,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: ColorConstant.kistlerBrandGreen,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "+49 152 22972391",
                        style: TextStyle(
                            color: ColorConstant.kistlerBrandGreen,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: ColorConstant.kistlerBrandGreen,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "https://kistler-machine.com",
                        style: TextStyle(
                            color: ColorConstant.kistlerBrandGreen,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: ColorConstant.kistlerBrandGreen,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Mackstrabe 84, D88348 Bad Saulgau",
                            style: TextStyle(
                                color: ColorConstant.kistlerBrandGreen,
                                fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset("assets/images/linkedin.png"))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(LocaleKeys.cancel.tr()),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        ColorConstant.kistlerBrandGreen)),
              ),
              SizedBox(),
              ElevatedButton(
                onPressed: () {},
                child: Text(LocaleKeys.send.tr()),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        ColorConstant.kistlerBrandGreen)),
              ),
              SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
