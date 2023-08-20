import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/Drawer.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/global_widgets/search_bar.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/accessories_container.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/application_images.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/technical_diagram.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/three_images_containers.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/youtube_video_player.dart';
import '../../../core/constants.dart/color.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: ColorConstant.kistlerWhite, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 10,
                  offset: Offset(1, 3),
                ),
              ]),
              height: 70,
              child: Center(
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .80,
                  child: SearchBarRefactor(),
                ),
              ),
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
                          Row(
                            children: [
                              Text(
                                "Close",
                                style: TextStyle(
                                    color: ColorConstant.kistlerBrandGreen),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.close,
                                  color: ColorConstant.kistlerBrandGreen)
                            ],
                          ),
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
                                child: Image.network(
                                  "https://imgs.search.brave.com/diuwAGp0a3Kc82mymdXgtdXUWi9BvTlMfBKEkqGQjLU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9oaXBz/LmhlYXJzdGFwcHMu/Y29tL3ZhZGVyLXBy/b2QuczMuYW1hem9u/YXdzLmNvbS8xNjc5/NTA3MjY2LXJ5b2Jp/LTY0MWIzZjNjOTEx/ODMuanBnP2Nyb3A9/MXh3OjF4aDtjZW50/ZXIsdG9wJnJlc2l6/ZT05ODA6Kg",
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
                            fontSize: 18,
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
                              fontSize: 16,
                              color: ColorConstant.kistlerTextColor),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstant.kistlerWhite),
                              ),
                            ),
                          ),
                          Container(
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstant.kistlerWhite),
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
                            fontSize: 16,
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 200,
                        color: Colors.amber,
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
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.kistlerTextColor),
                          ),
                          Row(
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
                      VideoPlayerScreen(),
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
