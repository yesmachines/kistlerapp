import 'package:flutter/widgets.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/api/categories_screen/models/get_all_products_res_model.dart';
import 'package:kistler/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class CategoriesScreenServices {
  Future<APIResponse> getProductsByCategories(
      {required Locale language, String? categoryId}) async {
    try {
      print("languagecode ${language.languageCode}");
      final APIResponse response = await ApiHelper.getData(
          endPoint: categoryId != null
              ? "/${language.languageCode}/categories-with-subcategories-products/$categoryId/"
              : "/${language.languageCode}/categories-with-subcategories-products/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        ProductsByCategoryresModel redData =
            ProductsByCategoryresModel.fromJson(response.data);
        return APIResponse(data: redData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch products");
      // return APIResponse(
      //     data: 'res data', error: true, errorMessage: 'failed to fetch data');
      rethrow;
    }
  }

  // Future<APIResponse> getProductsByCategoryId(
  //     {required Locale language}) async {
  //   try {
  //     print("languagecode ${language.languageCode}");
  //     final APIResponse response = await ApiHelper.getData(
  //         endPoint:
  //            "/${language.languageCode}/categories-with-subcategories-products/$categoryId/" ,
  //         header:
  //             ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
  //     if (response.error) {
  //       return response;
  //     } else {
  //       ProductsByCategoryresModel redData =
  //           ProductsByCategoryresModel.fromJson(response.data);
  //       return APIResponse(data: redData, error: false, errorMessage: '');
  //     }
  //   } catch (e) {
  //     print("failed to fetch products");
  //     // return APIResponse(
  //     //     data: 'res data', error: true, errorMessage: 'failed to fetch data');
  //     rethrow;
  //   }
  // }
}
