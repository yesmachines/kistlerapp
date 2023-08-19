import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/Drawer.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/global_widgets/search_bar.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/three_images_containers.dart';
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
                child: SingleChildScrollView(
              child: Column(
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
                          weight: 30, color: ColorConstant.kistlerBrandGreen),
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
                          fontSize: 16, color: ColorConstant.kistlerTextColor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorConstant.kistlerBrandGreen,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorConstant.kistlerBrandGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
