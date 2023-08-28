import 'package:flutter/material.dart';

import '../../../repository/api/login_screen/service/login_screen_service.dart';

class LoginScreenController extends ChangeNotifier {
  bool isSuccess = false;
  bool isLoading = false;

  // to Fetch the Course demo videos

  Future<bool> onProfileUpdate(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required String phoneNumber,
      required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await LoginScreenServides().onLogin(body: {
        "name": name,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "phone": phoneNumber,
      }, language: language);
      if (fetchedData.error != true) {
        isSuccess = true;
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
