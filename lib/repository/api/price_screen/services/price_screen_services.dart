import 'package:flutter/widgets.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';
import 'package:kistler/repository/helper/api_response.dart';
import '../../../helper/api_helper.dart';

class PriceScreenServices {
  Future<APIResponse> getProductPriceDetails({
    required Locale language,
    required String productId,
  }) async {
    // to get user id save in shared prefrence

    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint:
              "/${language.languageCode}/products-price-extra-list/$productId",
          header: ApiHelper.getApiHeader(
              access: await AppUtils.getAccessKey())); // pass header token
      if (response.error) {
        return response;
      } else {
        PriceDetailsResModel redData =
            PriceDetailsResModel.fromJson(response.data);
        return APIResponse(data: redData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch products");
      // return APIResponse(
      //     data: 'res data', error: true, errorMessage: 'failed to fetch data');
      rethrow;
    }
  }
}
