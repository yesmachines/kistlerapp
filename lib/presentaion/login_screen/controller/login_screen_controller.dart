import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';
import '../../../core/app_utils/app_utils.dart';
import '../../../repository/api/login_screen/models/login_res_model.dart';
import '../../../repository/api/login_screen/service/login_screen_service.dart';

class LoginScreenController extends ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  LoginResModel? loginData;

  // to Fetch the Course demo videos

  Future<bool> onLogin(
      {required String email,
      required String password,
      required Locale language}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await LoginScreenServides().onLogin(body: {
        "email": email,
        "password": password,
      }, language: language);
      if (fetchedData.error != true) {
        loginData = fetchedData.data;

        if (loginData != null) {
          Map<String, dynamic> sharedData = {
            'access': loginData!.token,
          };
          print(sharedData);

          ///setting shared pref
          ///this is where first time the data is stored to sharedpref as map converted json.
          sharedPreferences.setString(
              AppConfig.LOGIN_DATA, jsonEncode(sharedData));
        }

        print(await AppUtils.getAccessKey());

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
