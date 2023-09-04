import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/search_screen/controller/search_screen_controller.dart';
import 'package:provider/provider.dart';
import '../../../core/constants.dart/color.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../global_widgets/custom_product_container.dart';
import '../../product_details_screen/controller/product_details_screen_controller.dart';
import '../../product_details_screen/views/product_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    super.initState();
  }

  final searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchScreenProvider = Provider.of<SearchScreenController>(context);
    return Scaffold(
      backgroundColor: ColorConstant.kistlerWhite,
      appBar: CustomAppBar(languageButtonVisibility: false),
      body: SingleChildScrollView(
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
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: ColorConstant.kistlerBrandBorder)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchcontroller,
                            autofocus: true,
                            enableInteractiveSelection: false,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.search.tr(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<SearchScreenController>(context,
                                    listen: false)
                                .getSearchData(
                                    language: context.locale,
                                    searchText: searchcontroller.text.trim());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.kistlerBrandGreen,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: MediaQuery.of(context).size.height,
                            width: 55,
                            child: Icon(
                              Icons.search,
                              color: ColorConstant.kistlerWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            searchScreenProvider.isLoading
                ? Container(
                    padding: EdgeInsets.all(100),
                    child: ReusableLoadingIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: searchScreenProvider.searchedProductList.length == 0
                        ? Container(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(LocaleKeys.not_found_any_result.tr()))
                        : Container(
                            width: MediaQuery.of(context).size.width * .80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: searchScreenProvider
                                  .searchedProductList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => ChangeNotifierProvider(
                                      create: (context) =>
                                          ProductDetailsScreenController(),
                                      child: ProductDetailsScreen(
                                          productId: searchScreenProvider
                                              .searchedProductList[index].id
                                              .toString())),
                                )),
                                child: Container(
                                  height: 45,
                                  child: Text(
                                    searchScreenProvider
                                            .searchedProductList[index].title ??
                                        "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  )
          ],
        ),
      ),
    );
  }
}
