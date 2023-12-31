import 'package:flutter/material.dart';
import 'package:kistler/repository/api/profile_screen/model/logout_res_model.dart';
import 'package:kistler/repository/api/profile_screen/model/user_profile_res_model.dart';
import 'package:kistler/repository/api/profile_screen/service/user_profile_screen_service.dart';

class ProfileScreenController extends ChangeNotifier {
  // to make it default loading
  bool isLoading = true;
  LogoutResModel? logoutData;
  Profile? userData;

  Future<bool> getUserData({required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      print((userData?.imageUrl.toString() ?? "") + "userImage1");
      // need to update values from  user input
      final fetchedData = await ProfileScreenServices()
          .getUserProfileDetails(language: language);
      if (fetchedData.error != true) {
        UserProfileResModel resData = fetchedData.data;

        userData = resData.profile;

        print(resData);

        print((userData?.imageUrl.toString() ?? "") + "userImage");
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

  Future<bool> onLogout({required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedData =
          await ProfileScreenServices().onLogout(language: language);
      if (fetchedData.error != true) {
        LogoutResModel resData = fetchedData.data;
        logoutData = resData;

        print((userData?.imageUrl.toString() ?? "") + "userImage");
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
