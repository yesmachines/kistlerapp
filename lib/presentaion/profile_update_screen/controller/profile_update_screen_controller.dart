import 'package:flutter/material.dart';

import '../../../repository/api/login_screen/service/login_screen_service.dart';

class ProfileUpdateScreenController extends ChangeNotifier {
  bool isSuccess = false;
  bool isLoading = false;
  String? errorMessage;

  // to Fetch the Course demo videos

  Future<bool> onProfileUpdate(
      {String? name,
      String? email,
      String? password,
      String? confirmPassword,
      String? phoneNumber,
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
        errorMessage = fetchedData.errorMessage;
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
