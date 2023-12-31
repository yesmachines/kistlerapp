import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/price_screen/controller/price_screen_controller.dart';
import 'package:kistler/presentaion/price_screen/view/widgets/expansion_tile_refactor.dart';
import 'package:kistler/presentaion/quote_summary_screen/view/quote_summary_screen.dart';
import 'package:provider/provider.dart';

class PriceScreen extends StatefulWidget {
  final String productId;

  const PriceScreen({super.key, required this.productId});
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PriceScreenController>(context, listen: false)
          .getProductPriceDetails(
              language: context.locale, productId: widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PriceScreenController>(context);
    return Scaffold(
      appBar: CustomAppBar(languageButtonVisibility: false),
      body: provider.isLoading
          ? ReusableLoadingIndicator()
          : RefreshIndicator(
              color: ColorConstant.kistlerBrandGreen,
              onRefresh: () async {
                await Provider.of<PriceScreenController>(context, listen: false)
                    .getProductPriceDetails(
                        language: context.locale, productId: widget.productId);
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      height: 180,
                      width: 180,
                      child: Center(
                        child: CommonImageView(
                          fit: BoxFit.fill,
                          url: provider.prosuctDetails?.defaultImage,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      provider.prosuctDetails?.title ?? "N/a",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: ColorConstant.kistlerBrandGreen),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.model_name.tr(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ExpansionTileRefactor(
                            modelDescription:
                                provider.modelsList[index].description ?? "",
                            tilenumber:
                                index < 10 ? "0${index + 1}" : index.toString(),
                            modelDetails: provider.modelsList[index],
                            accessoriesList:
                                provider.modelsList[index].accessoriesList ??
                                    [],
                            extrasList:
                                provider.modelsList[index].extrasList ?? [],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: provider.modelsList.length ?? 0)
                ]),
              ),
            ),
      bottomNavigationBar: InkWell(
        onTap: () {
          provider.calculateTotalPrice() > 0
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuoteSummaryScreen(
                            productId: widget.productId,
                          )))
              : AppUtils.oneTimeSnackBar(LocaleKeys.no_item_selected.tr(),
                  context: context);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 50, bottom: 20, right: 50),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.kistlerBrandGreen,
            ),
            child: Center(
              child: Text(
                LocaleKeys.add_to_quote.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorConstant.kistlerWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
