import 'package:kistler/repository/helper/api_response.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class LoginScreenServides {
  Future<APIResponse> onLogin({required Map<String, dynamic> body}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/api/auth/login/",
          header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        // LoginResModel redData = LoginResModel.fromJson(response.data);
        return APIResponse(data: 'redData', error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch course list in home screen");
      // return APIResponse(
      //     data: 'res data', error: true, errorMessage: 'failed to fetch data');
      rethrow;
    }
  }
}
