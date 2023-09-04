import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/repository/image_save_share_service.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String designation;
  final String mobileNumber;
  final String email;
  final String linkedin;
  final String website;

  ProfileCard({
    required this.name,
    required this.designation,
    required this.mobileNumber,
    required this.email,
    required this.linkedin,
    required this.website,
  });
  @override
  Widget build(BuildContext context) {
    final shareCardKey = GlobalKey();

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: shareCardKey,
            child: Card(
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
                      name,
                      style: TextStyle(
                          color: ColorConstant.kistlerBrandGreen,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 240,
                      child: Text(
                        designation,
                        style: TextStyle(
                            color: ColorConstant.kistlerBrandGreen,
                            fontSize: 12,
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
                          mobileNumber,
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
                          email,
                          style: TextStyle(
                            color: ColorConstant.kistlerBrandGreen,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset("assets/images/linkedin.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          linkedin,
                          style: TextStyle(
                              color: ColorConstant.kistlerBrandGreen,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
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
                          website,
                          style: TextStyle(
                              color: ColorConstant.kistlerBrandGreen,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
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
                onPressed: () {
                  CardShareAndSaveServices().shareWidgetAsImage(shareCardKey);
                },
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
