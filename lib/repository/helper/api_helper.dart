// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../../core/app_utils.dart';

// class ApiHelper {
// //  HTTP GET
// //
// //
// //
//   Future<List<dynamic>> fetchData() async {
//     final response = await http.get(Uri.parse(''));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

// //  HTTP Post
// //
// //
// //
//   Future<bool> createRecord(Map<String, dynamic> recordData) async {
//     final response = await http.post(
//       Uri.parse(''),
//       body: jsonEncode(recordData),
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode == 201) {
//       return true;
//     } else {
//       return false;
//     }
//   }

// //  HTTP Updates
// //
// //
// //
//   Future<bool> updateRecord(String id, Map<String, dynamic> updatedData) async {
//     final response = await http.put(
//       Uri.parse(''),
//       body: jsonEncode(updatedData),
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }

// //  HTTP Delete
// //
// //
// //
//   Future<bool> deleteRecord(String id) async {
//     final response = await http.delete(
//       Uri.parse('https://your-api-url.com/data/$id'),
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../app_config/app_config.dart';
import '../../core/app_utils/app_utils.dart';
import 'api_response.dart';

class ApiHelper {
  // static const String baseUrl =
  //     'http://3.110.186.49:8000/'; // Replace with your API base URL

  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    // AppUtils.logger.d("Access : Bearer $access");

    if (access != null) {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access'
      };
    } else if (dbName != null) {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'dbName': dbName,
      };
    } else {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
  }

  static getData(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    if (await AppUtils.isOnline()) {
      final uri = Uri.parse(finalUrl ?? (AppConfig.finalUrl + endPoint));
      // AppUtils.logger.i(uri);
      final res = await http.get(uri, headers: header);
      // AppUtils().printData('getData res ${utf8.decode(res.bodyBytes)}');
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print(resBody);
        if (resBody['status'] == '1') {
          print(resBody);
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          print(resBody);
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody['message'] ?? 'Something went wrong!');
        }
      } else {
        return APIResponse(
            data: '', error: true, errorMessage: 'Something went wrong!');
      }
    }
  }

  //for post
  ///endpoint is applied olny if finalUrl is empty
  static Future<APIResponse> postData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      String? finalUrl}) async {
    // AppUtils().printData('$body');
    // AppUtils().printData('postData');
    // AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      print("uri :$uri");
      // AppUtils.logger.i(uri);
      // print(header);
      final res = await http.post(uri, headers: header, body: jsonEncode(body));
      print(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == '1') {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          // AppUtils.oneTimeSnackBar(resBody['message'].toString());
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody['message'].toString() ?? 'Something went wrong!');
        }
      } else {
        // AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  //patch
  static Future<APIResponse> patchData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    if (await AppUtils.isOnline()) {
      // AppUtils().printData('$body');
      // AppUtils().printData('patch body above');
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      // AppUtils.logger.i(uri);
      // print(header);
      final res =
          await http.patch(uri, headers: header, body: jsonEncode(body));
      print(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == '1') {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          // AppUtils.oneTimeSnackBar(
          //     resBody['message'] ?? 'Something went wrong!',
          //     bgColor: ColorConstant.red);
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody['message'].toString() ?? 'Something went wrong!');
        }
      } else {
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   AppUtils().printError('patchData() in api helper $e');
      //   AppUtils.throwError(e);
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

//   static Future<dynamic> get(String endpoint) async {
//     final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
//     return _handleResponse(response);
//   }

// //
// //
// //
// //
// //
//   static Future<dynamic> post(String endpoint, dynamic data) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/$endpoint'),
//       body: jsonEncode(data),
//       headers: {'Content-Type': 'application/json'},
//     );
//     return _handleResponse(response);
//   }

// //
// //
// //
// //
// //
//   static Future<dynamic> patch(String endpoint, dynamic data) async {
//     final response = await http.patch(
//       Uri.parse('$baseUrl/$endpoint'),
//       body: jsonEncode(data),
//       headers: {'Content-Type': 'application/json'},
//     );
//     return _handleResponse(response);
//   }

// //
// //
// //
// //
// //
//   static Future<dynamic> put(String endpoint, dynamic data) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/$endpoint'),
//       body: jsonEncode(data),
//       headers: {'Content-Type': 'application/json'},
//     );
//     return _handleResponse(response);
//   }

// //
// //
// //
// //
// //
//   static Future<dynamic> delete(String endpoint) async {
//     final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
//     return _handleResponse(response);
//   }

//
//

  static bool isRequestSucceeded(int statusCode) {
    if (statusCode == 401) {
      // AppUtils.oneTimeSnackBar("Login session Expired! , Login again to continue.",bgColor: Colors.red,time: 3);
      // Routes.router.navigator!.context.replace('/LoginScreen');
      // Get.toNamed("/LogInScreen");
      // checkTokenValidity();
      // Routes.router.routerDelegate.navigatorKey.currentState!.context
      //     .go("/SignInScreen");
      // AppUtils.oneTimeSnackBar(
      //     "Session Expired ! , Please re-login to continue",
      //     bgColor: Colors.red,
      //     time: 3);
    }

    ///if 402 ie. subscription expired
    if (statusCode == 402) {
      // Routes.router.routerDelegate.navigatorKey.currentState!.context
      //     .go("/SubscriptionRequiredScreen");
      // AppUtils.oneTimeSnackBar("Subscription Expired !",
      //     bgColor: Colors.red, time: 3);
    }

    ///todo : need to handle in other way
    // return statusCode >= 200 && statusCode < 401||statusCode==500;
    return statusCode >= 200 && statusCode <= 404 || statusCode == 500;
  }
//
//
//

  // static dynamic _handleResponse(http.Response response) {
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // Success
  //     return jsonDecode(response.body);
  //   } else {
  //     // Error

  //     throw Exception('API request failed with status ${response.statusCode}');
  //   }
  // }
}
