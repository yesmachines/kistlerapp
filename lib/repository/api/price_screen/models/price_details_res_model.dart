// To parse this JSON data, do
//
//     final priceDetailsResModel = priceDetailsResModelFromJson(jsonString);

import 'dart:convert';

PriceDetailsResModel priceDetailsResModelFromJson(String str) =>
    PriceDetailsResModel.fromJson(json.decode(str));

String priceDetailsResModelToJson(PriceDetailsResModel data) =>
    json.encode(data.toJson());

class PriceDetailsResModel {
  String? status;
  int? id;
  String? title;
  String? defaultImage;
  List<ProductModels>? productM0delsList;

  PriceDetailsResModel({
    this.status,
    this.id,
    this.title,
    this.defaultImage,
    this.productM0delsList,
  });

  factory PriceDetailsResModel.fromJson(Map<String, dynamic> json) =>
      PriceDetailsResModel(
        status: json["status"],
        id: json["id"],
        title: json["title"],
        defaultImage: json["default_image"],
        productM0delsList: json["product_price_list"] == null
            ? []
            : List<ProductModels>.from(json["product_price_list"]!
                .map((x) => ProductModels.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
        "title": title,
        "default_image": defaultImage,
        "product_price_list": productM0delsList == null
            ? []
            : List<dynamic>.from(productM0delsList!.map((x) => x.toJson())),
      };
}

class ProductModels {
  int id;
  String? title;
  int price;
  String? description;
  bool isSelected;
  int quantity;
  List<ItemModel> accessoriesList;
  List<ItemModel> extrasList;

  ProductModels({
    required this.id,
    this.title,
    this.price = 0,
    this.description,
    this.isSelected = false,
    this.quantity = 0,
    this.accessoriesList = const [],
    this.extrasList = const [],
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        accessoriesList: json["price_accessories"] == null
            ? []
            : List<ItemModel>.from(
                json["price_accessories"]!.map((x) => ItemModel.fromJson(x))),
        extrasList: json["price_extra"] == null
            ? []
            : List<ItemModel>.from(
                json["price_extra"]!.map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "price_accessories": accessoriesList == null
            ? []
            : List<dynamic>.from(accessoriesList!.map((x) => x.toJson())),
        "price_extra": extrasList == null
            ? []
            : List<dynamic>.from(extrasList!.map((x) => x.toJson())),
      };
}

class ItemModel {
  int id;
  String? title;
  int price;
  int? status;
  bool isSelected;
  int quantity;

  ItemModel({
    required this.id,
    this.title,
    this.price = 0,
    this.status,
    this.isSelected = false,
    this.quantity = 0,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "status": status,
      };
}
