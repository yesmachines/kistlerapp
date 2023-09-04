import 'package:flutter/widgets.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/api/search_screen/models/serach_res_model.dart';
import 'package:kistler/repository/helper/api_response.dart';
import '../../../helper/api_helper.dart';

class SearchScreenServices {
  Future<APIResponse> getSearchResult(
      {required Locale language, required Map<String, dynamic> body}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          // https://bigleap.tech/apiKistler/public/api/v1/en/search
          endPoint: "/${language.languageCode}/search",
          header: ApiHelper.getApiHeader(
              access: await AppUtils.getAccessKey())); // pass header token
      if (response.error) {
        return response;
      } else {
        SearchResultResModel redData =
            SearchResultResModel.fromJson(response.data);
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
