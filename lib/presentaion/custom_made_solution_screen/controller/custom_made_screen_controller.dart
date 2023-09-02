import 'package:flutter/material.dart';
import 'package:kistler/repository/api/custom_Made_screen/services/custom_made_screen_services.dart';

class CustomMadeScreenController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<bool> sendCustomEnquiry(
      {String? name,
      String? email,
      String? phoneNumber,
      String? productName,
      String? country,
      String? companyName,
      String? description,
      required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedData =
          await CustomMadeScreenServices().customMadeEmail(body: {
        "name": name,
        "email": email,
        "phone": phoneNumber,
        "product_name": productName,
        "country": country,
        "company": companyName,
        "description": description
      }, language: language);
      if (fetchedData.error != true) {
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
