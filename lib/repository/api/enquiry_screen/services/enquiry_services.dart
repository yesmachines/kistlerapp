import 'package:flutter/widgets.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/helper/api_response.dart';
import '../../../helper/api_helper.dart';

class EnquiryScreenServices {
  Future<APIResponse> sendEnquiry(
      {required Locale language, required Map<String, dynamic> body}) async {
    final userId = await AppUtils.getUserId();
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/${language.languageCode}/send-enquiry-mail/$userId",
          header: ApiHelper.getApiHeader(
              access: await AppUtils.getAccessKey())); // pass header token
      if (response.error) {
        return response;
      } else {
        // UserProfileResModel redData =
        //     UserProfileResModel.fromJson(response.data);
        return APIResponse(data: "redData", error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to update profile");
      // return APIResponse(
      //     data: 'res data', error: true, errorMessage: 'failed to fetch data');
      rethrow;
    }
  }
}
