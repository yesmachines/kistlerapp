// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/Drawer.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/enquiry_screen/view/enquiry_screen.dart';

import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/accessories_container.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/application_images.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/main_page_table_refactor.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/technical_diagram.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/three_images_containers.dart';

import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants.dart/color.dart';
import '../../price_screen/view/price_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final String _linkUrl = 'https://www.youtube.com/watch?v=ENSjcy3eh8U';
  final String _brochure_Download =
      'https://cms.kistler-machine.com/storage/pdf/Wendewalzen-der-Baureihe-SAR---Selbsteinstellend1686046160.pdf';

  int selectedNumber = 1;

  final List<Map<dynamic, dynamic>> data = [
    {
      "no": "SCM300",
      "name": "1",
      "price": "12",
      "qty": "32",
      "select": "22",
      "cutting": "22"
    },
    {
      "no": "SCM400",
      "name": "1",
      "price": "30",
      "qty": "6",
      "select": "33",
      "cutting": "22"
    },
    {
      "no": "SCM630",
      "name": "1",
      "price": "18",
      "qty": "22",
      "select": "44",
      "cutting": "22"
    },

    // Add more rows as needed
  ];

  _launchURL() async {
    if (await canLaunch(_linkUrl)) {
      await launch(_linkUrl);
    } else {
      throw 'Could not launch $_linkUrl';
    }
  }

  _brocture_Download() async {
    if (await canLaunch(_brochure_Download)) {
      await launch(_brochure_Download);
    } else {
      throw 'Could not launch $_brochure_Download';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(languageButtonVisibility: false),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Icon(Icons.share,
                              weight: 30,
                              color: ColorConstant.kistlerBrandGreen),
                        ],
                      ),
                      SizedBox(height: 20),
                      Stack(
                        children: [
                          SizedBox(
                            height: 240,
                            child: Container(
                              height: 240,
                              width: MediaQuery.of(context).size.width * 75,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  "assets/images/imageee.jpeg",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              height: 30,
                              width: 100,
                              child: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.fitWidth,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),

                          // here is calling the three images containers
                          ThreeImagesContainers(),
                          SizedBox(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Programmable Saddle Cutting Machines - SCM Series",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: ColorConstant.kistlerBrandGreen),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "PLC-Controlled",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorConstant.kistlerTextColor),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Enquirycreen()));
                            },
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstant.kistlerBrandGreen,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.enquiry.tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.kistlerWhite),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyTable()));
                            },
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstant.kistlerBrandGreen,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.price.tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.kistlerWhite),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          LocaleKeys.description.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Description: The SCM machines are equipped with two PLC-controlled axis which enables the machin to cut pipes in conjunction with a plasma or oxy-fuel torch. The work piece is clamped by a driven chuck (axis1), then the torch is moved ovr the pipe (axis2). Optional, a third controlled axis can be added to enable the machine to bevel end cuts (straight, miter and branches). All programming is menu-driven, the machine is therefore easy to operate.",
                        style: TextStyle(fontSize: 14, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${LocaleKeys.specificattion.tr()} :",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return MainPageTable(data: data);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "*Other than specified sizes available or request",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.catalogue.tr(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.kistlerTextColor),
                          ),
                          InkWell(
                            onTap: _brocture_Download,
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.download.tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstant.kistlerBrandGreen),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.file_download_outlined,
                                    color: ColorConstant.kistlerBrandGreen)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.share.tr(),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: ColorConstant.kistlerBrandGreen),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(Icons.share,
                                  size: 20,
                                  color: ColorConstant.kistlerBrandGreen)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          LocaleKeys.application.tr(),
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
                        "Pipe cutting machines of the SCM range are used for pipe cutting and profiling in the workshop as well as on site.",
                        style: TextStyle(fontSize: 14, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // here is calling the video player screen
                      GestureDetector(
                          onTap: _launchURL,
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/thumbnail.jpg",
                              fit: BoxFit.fitWidth,
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          LocaleKeys.application_images.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ApplicationImages(),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          LocaleKeys.technical_diagram.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TechnicalDiagram(),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          LocaleKeys.accessories.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Card(
                              child: Container(
                                width: 150, // Adjust the width as needed
                                child: Center(
                                  child: AccessoriesContainer(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
