import 'package:flutter/material.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';
import 'package:kistler/repository/api/price_screen/services/price_screen_services.dart';
import 'package:kistler/repository/api/profile_screen/service/user_profile_screen_service.dart';

class PriceScreenController extends ChangeNotifier {
  bool isLoading = false;

  List<ProductModels> modelsList = [];
  PriceDetailsResModel? prosuctDetails;

  Future<bool> getProductPriceDetails(
      {required Locale language, required String productId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await PriceScreenServices()
          .getProductPriceDetails(language: language, productId: productId);
      if (fetchedData.error != true) {
        PriceDetailsResModel resData = fetchedData.data;
        prosuctDetails = resData;

        modelsList = resData.productM0delsList ?? [];

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
}
