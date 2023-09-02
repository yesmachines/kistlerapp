import 'package:flutter/material.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';
import 'package:kistler/repository/api/product_details_screen/service/product_details_secreen_service.dart';

class ProductDetailsScreenController extends ChangeNotifier {
  bool isLoading = false;

  ProductDetailsResModel? productDetails;
  SpecDataArr? specsTableData;
  List<Map<String, dynamic>> tableData = [];
  List<String> tableTitles = [];
  List<String> tableKeyDataList = [];
  String? setDefaultImage;

  // to Fetch the Course demo videos

  Future<bool> getPoductDetails({
    required Locale language,
    required String productId,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ProductDetailsScreenServices()
          .getProducteDetails(language: language, productId: productId);
      if (fetchedData.error != true) {
        productDetails = fetchedData.data;
        if (productDetails != null) {
          setDefaultImage = productDetails?.products?.defaultImage;

          specsTableData = productDetails!.specDataArr;
          tableData = specsTableData?.specData ?? [];
          tableTitles = specsTableData?.specTitles ?? [];
          if (tableData.isNotEmpty) {
            tableKeyDataList = tableData.first.keys.toList();
          }
        }

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
      rethrow;
    }
  }

  onDefaultImageupdation(String? newImgeUrl) {
    setDefaultImage = newImgeUrl;
    notifyListeners();
  }
}
