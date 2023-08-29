import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kistler/repository/api/profile_screen/model/user_profile_res_model.dart';
import 'package:kistler/repository/api/profile_screen/service/user_profile_screen_service.dart';

class ProfileScreenController extends ChangeNotifier {
  bool isLoading = false;

  Profile? userData;

  // to Fetch the Course demo videos

  Future<bool> getUserData({required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ProfileScreenServices()
          .getUserProfileDetails(language: language);
      if (fetchedData.error != true) {
        UserProfileResModel resData = fetchedData.data;
        userData = resData.profile;

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
