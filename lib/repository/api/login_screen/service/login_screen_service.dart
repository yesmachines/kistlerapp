import 'package:flutter/widgets.dart';
import 'package:kistler/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';
import '../models/login_res_model.dart';

class LoginScreenServides {
  Future<APIResponse> onLogin(
      {required Map<String, dynamic> body, required Locale language}) async {
    try {
      print("languagecode ${language.languageCode}");
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/${language.languageCode}/login",
          header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        LoginResModel redData = LoginResModel.fromJson(response.data);
        return APIResponse(data: redData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("login failed");
      // return APIResponse(
      //     data: 'res data', error: true, errorMessage: 'failed to fetch data');
      rethrow;
    }
  }
}
