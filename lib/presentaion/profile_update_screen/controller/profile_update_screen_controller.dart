import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/api/profile_update_screen/services/profile_update_screen_services.dart';

class ProfileUpdateScreenController extends ChangeNotifier {
  bool isSuccess = false;
  bool isLoading = false;
  String? errorMessage;
  File? profileImgeFile;
  File? qrImgeFile;

  bool isPasswordVissible = false;
  bool isConfirmPasswordVisible = false;

  // to Fetch the Course demo videos

  Future<bool> onProfileUpdate(
      {String? fullName,
      String? email,
      String? password,
      String? confirmPassword,
      String? phoneNumber,
      String? designation,
      File? profileiImage,
      File? qrImage,
      String? linkedin,
      required Locale language}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ProfileUpdateScreenServices().onUpdateProfile(
        language: language,
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
        designation: designation,
        profileiImage: profileiImage,
        qrImage: qrImage,
        linkedin: linkedin,
      );
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

  Future<File?> getImage({required ImageSource source}) async {
    final ImagePicker _picker = ImagePicker();
// Pick an image
    final XFile? image = await _picker.pickImage(source: source);
//TO convert Xfile into file
    File? file = image != null ? File(image.path) : null;

//print(‘Image picked’);
    return file;
  }

  selectProfileImge(
      {required ImageSource source, required BuildContext context}) async {
    profileImgeFile = await getImage(source: source);
    if (qrImgeFile != null) {
      AppUtils.oneTimeSnackBar("Image uploaded successfully", context: context);
    } else {
      AppUtils.oneTimeSnackBar("Failed to upload Image", context: context);
    }
    notifyListeners();
  }

  selectQrImage(
      {required ImageSource source, required BuildContext context}) async {
    qrImgeFile = await getImage(source: source);
    if (qrImgeFile != null) {
      AppUtils.oneTimeSnackBar("Image uploaded successfully", context: context);
    } else {
      AppUtils.oneTimeSnackBar("Failed to upload Image", context: context);
    }
    notifyListeners();
  }

  onPasswordVisibilityPressed() {
    isPasswordVissible = !isPasswordVissible;
    notifyListeners();
  }

  onConfirmPasswordVisibilityPressed() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }
}
