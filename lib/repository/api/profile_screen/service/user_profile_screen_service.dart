import 'package:flutter/widgets.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/api/profile_screen/model/user_profile_res_model.dart';
import 'package:kistler/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class ProfileScreenServices {
  Future<APIResponse> getUserProfileDetails({required Locale language}) async {
    // to get user id save in shared prefrence
    final userId = await AppUtils.getUserId();
    try {
      print("languagecode ${language.languageCode}");
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/${language.languageCode}/profile/$userId/",
          header: ApiHelper.getApiHeader(
              access: await AppUtils.getAccessKey())); // pass header token
      if (response.error) {
        return response;
      } else {
        UserProfileResModel redData =
            UserProfileResModel.fromJson(response.data);
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
