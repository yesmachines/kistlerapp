import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kistler/repository/api/enquiry_screen/services/enquiry_services.dart';
import 'package:kistler/repository/api/profile_update_screen/services/profile_update_screen_services.dart';

class EnquiryScreenController extends ChangeNotifier {
  bool isSuccess = false;
  bool isLoading = false;
  String? errorMessage;

  Future<bool> onEnquirySend(
      {String? modelName,
      String? name,
      String? email,
      String? phoneNumber,
      required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedData = await EnquiryScreenServices().sendEnquiry(body: {
        "model": modelName,
        "name": name,
        "email": email,
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
