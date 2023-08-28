// To parse this JSON data, do
//
//     final userProfileResModel = userProfileResModelFromJson(jsonString);

import 'dart:convert';

UserProfileResModel userProfileResModelFromJson(String str) =>
    UserProfileResModel.fromJson(json.decode(str));

String userProfileResModelToJson(UserProfileResModel data) =>
    json.encode(data.toJson());

class UserProfileResModel {
  String? status;
  Profile? profile;

  UserProfileResModel({
    this.status,
    this.profile,
  });

  factory UserProfileResModel.fromJson(Map<String, dynamic> json) =>
      UserProfileResModel(
        status: json["status"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "profile": profile?.toJson(),
      };
}

class Profile {
  String? name;
  String? email;
  String? phone;
  String? imageUrl;

  Profile({
    this.name,
    this.email,
    this.phone,
    this.imageUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "image_url": imageUrl,
      };
}
