// To parse this JSON data, do
//
//     final logoutResModel = logoutResModelFromJson(jsonString);

import 'dart:convert';

LogoutResModel logoutResModelFromJson(String str) =>
    LogoutResModel.fromJson(json.decode(str));

String logoutResModelToJson(LogoutResModel data) => json.encode(data.toJson());

class LogoutResModel {
  String? message;
  String? status;

  LogoutResModel({
    this.message,
    this.status,
  });

  factory LogoutResModel.fromJson(Map<String, dynamic> json) => LogoutResModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
