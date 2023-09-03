import 'package:flutter/material.dart';
import 'package:kistler/repository/api/quotation_summary_screen/services/quotation_summary_screen_service.dart';

class QuotationSummaryScreenController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<bool> sendQuotation(
      {String? name,
      String? email,
      String? phoneNumber,
      String? productId,
      String? companyName,
      String? comment,
      Map<String, dynamic>? quptationData,
      required Locale language}) async {
    isLoading = true;
    notifyListeners();

    print({
      "name": name,
      "email": email,
      "phone": phoneNumber,
      "product_id": productId,
      "company": companyName,
      "comment": comment,
      ...quptationData != null ? quptationData : {}
    });

    try {
      final fetchedData =
          await QuotationSummaryScreenServices().sendQuotation(body: {
        "name": name,
        "email": email,
        "phone": phoneNumber,
        "product_id": productId,
        "company": companyName,
        "comment": comment,
        ...quptationData != null ? quptationData : {}
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
