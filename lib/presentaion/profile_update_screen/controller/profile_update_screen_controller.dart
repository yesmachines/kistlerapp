import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kistler/repository/api/profile_update_screen/services/profile_update_screen_services.dart';

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
      String? designation,
      File? profileiImage,
      File? qrImage,
      required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData =
          await ProfileUpdateScreenServices().updateProfile(body: {
        "name": name,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "phone": phoneNumber,
        "image_url": profileiImage,
        "qr_code": qrImage,
        "designation": designation
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
