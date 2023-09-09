import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/helper/api_helper.dart';
import 'package:kistler/repository/helper/api_response.dart';
import 'package:path/path.dart';

class ProfileUpdateScreenServices {
  Future<APIResponse> onUpdateProfile(
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
    final header =
        ApiHelper.getApiHeader(access: await AppUtils.getAccessKey());
    print(header);
    final userId = await AppUtils.getUserId();
    var url = Uri.parse(
        "https://api.kistler-machine.com/api/v1/${language.languageCode}/profile-update/$userId"); // Replace with your API endpoint

    try {
      // Prepare the request body
      var request = http.MultipartRequest('POST', url);

      // Add text fields to the request body
      if (fullName != null) {
        request.fields['name'] = fullName;
      }
      if (email != null) {
        request.fields['email'] = email;
      }
      if (designation != null) {
        request.fields['designation'] = designation;
      }
      if (phoneNumber != null) {
        request.fields['phone'] = phoneNumber;
      }
      if (linkedin != null) {
        request.fields['linkedin'] = linkedin;
      }
      if (password != null && confirmPassword != null) {
        request.fields['confirm_password'] = confirmPassword;
        request.fields['password'] = password;
      }

      // Add image files to the request body

      profileiImage != null
          ? request.files.add(await http.MultipartFile.fromPath(
              'image_url', profileiImage.path,
              filename: basename(profileiImage.path)))
          : null;

      qrImage != null
          ? request.files.add(await http.MultipartFile.fromPath(
              'qr_code', qrImage.path,
              filename: basename(qrImage.path)))
          : null;

      // Add headers
      request.headers.addAll(
          ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));

      // Send the request
      final http.Response res =
          await http.Response.fromStream(await request.send());
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        print('post resBody');
        print(resBody);
        if (resBody['status'] == '1') {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          // AppUtils.oneTimeSnackBar(resBody['message'].toString());
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody['message'].toString() ?? 'Something went wrong!');
        }
      } else {
        // AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  static bool isRequestSucceeded(int statusCode) {
    return statusCode >= 200 && statusCode <= 404 || statusCode == 500;
  }
}
