// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/Drawer.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/enquiry_screen/view/enquiry_screen.dart';
import 'package:kistler/presentaion/product_details_screen/controller/product_details_screen_controller.dart';

import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/accessories_container.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/application_images.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/main_page_table_refactor.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/technical_diagram.dart';
import 'package:kistler/presentaion/product_details_screen/views/productdetails_widgets/product_images_containers.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants.dart/color.dart';
import '../../price_screen/view/price_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print(widget.productId.toString() + " productId");
      Provider.of<ProductDetailsScreenController>(context, listen: false)
          .getPoductDetails(
        language: context.locale,
        productId: widget.productId,
      );
    });
    super.initState();
  }

  final String _linkUrl = 'https://www.youtube.com/watch?v=ENSjcy3eh8U';
  String? brochure_Download;

  int selectedNumber = 1;

  // final List<Map<String, dynamic>> data = [
  //   {
  //     "no": "SCM300",
  //     "name": "1",
  //     "price": "12",
  //     "qty": "32",
  //     "select": "22",
  //     "cutting": "22"
  //   },
  //   {
  //     "no": "SCM400",
  //     "name": "1",
  //     "price": "30",
  //     "qty": "6",
  //     "select": "33",
  //     "cutting": "22"
  //   },
  //   {
  //     "no": "SCM630",
  //     "name": "1",
  //     "price": "18",
  //     "qty": "22",
  //     "select": "44",
  //     "cutting": "22"
  //   },

  //   // Add more rows as needed
  // ];

  // List<String> title = [
  //   "no",
  //   "name",
  //   "price",
  //   "qty",
  //   "select",
  //   "cutting",
  // ];
  // List<String> title = [
  //   "specification",
  //   "data",
  //   "value",
  //   "qualitu",
  //   "sdhh",
  //   "alksdok",
  // ];

  _launchURL() async {
    if (await canLaunch(_linkUrl)) {
      await launch(_linkUrl);
    } else {
      throw 'Could not launch $_linkUrl';
    }
  }

  _brocture_Download_service() async {
    if (await canLaunch(brochure_Download!)) {
      await launch(brochure_Download!);
    } else {
      throw 'Could not launch $brochure_Download';
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDetailsScreenController>(context);
    brochure_Download = provider.productDetails?.productPdf?.catalogue ?? "";
    return Scaffold(
      appBar: CustomAppBar(languageButtonVisibility: false),
      drawer: CustomDrawer(),
      body: provider.isLoading
          ? ReusableLoadingIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
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
                                    width:
                                        MediaQuery.of(context).size.width * 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: CommonImageView(
                                        fit: BoxFit.contain,
                                        url: provider.productDetails?.products
                                            ?.defaultImage,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 30,
                                    width: 100,
                                    child: CommonImageView(
                                      fit: BoxFit.contain,
                                      url: provider
                                          .productDetails?.products?.brandImage,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(),

                            // here is calling the three images containers
                            ProductImagesListContainers(
                                productImageList:
                                    provider.productDetails?.productImages ??
                                        []),
                            SizedBox(),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              provider.productDetails?.products?.ttitle ??
                                  "N/a",
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
                                provider.productDetails?.products?.tsubtite ??
                                    "",
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
                                            builder: (context) =>
                                                Enquirycreen()));
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
                              provider.productDetails?.products?.tdescription ??
                                  "N/a",
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
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MainPageTable(
                                  data: provider.tableData.isNotEmpty
                                      ? provider.tableData
                                      : [],
                                  columnTitles: provider.tableData.isNotEmpty
                                      ? provider.tableTitles
                                      : [],
                                  keyList: provider.tableData.isNotEmpty
                                      ? provider.tableKeyDataList
                                      : [],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  "*Other than specified sizes available or request", // TODO: need to be transalated
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
                                  onTap: _brocture_Download_service,
                                  child: Row(
                                    children: [
                                      Text(
                                        LocaleKeys.download.tr(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: ColorConstant
                                                .kistlerBrandGreen),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(Icons.file_download_outlined,
                                          color:
                                              ColorConstant.kistlerBrandGreen)
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
                                          color:
                                              ColorConstant.kistlerBrandGreen),
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

                            (provider.productDetails
                                            ?.productApplicationImages !=
                                        null &&
                                    provider
                                        .productDetails! // TODO : NULL CHECK ISSUE MIGHT COME
                                        .productApplicationImages!
                                        .isNotEmpty)
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      LocaleKeys.application_images.tr(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : SizedBox(),

                            (provider.productDetails
                                            ?.productApplicationImages !=
                                        null &&
                                    provider
                                        .productDetails! // TODO : NULL CHECK ISSUE MIGHT COME
                                        .productApplicationImages!
                                        .isNotEmpty)
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: ApplicationImages(
                                        imageList: provider.productDetails!
                                                .productApplicationImages ??
                                            []),
                                  )
                                : SizedBox(),

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
                            (provider.productDetails?.productAccessories !=
                                        null &&
                                    provider.productDetails!.productAccessories!
                                        .isNotEmpty)
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      LocaleKeys.accessories.tr(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : SizedBox(),

                            (provider.productDetails?.productAccessories !=
                                        null &&
                                    provider.productDetails!.productAccessories!
                                        .isNotEmpty)
                                ? ListView.builder(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Card(
                                          child: Container(
                                            width:
                                                150, // Adjust the width as needed
                                            child: Center(
                                              child: AccessoriesContainer(
                                                  accessoryData: provider
                                                          .productDetails
                                                          ?.productAccessories?[
                                                      index]),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : SizedBox(),
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
