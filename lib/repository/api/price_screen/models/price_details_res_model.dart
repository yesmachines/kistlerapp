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
  int? id;
  String? title;
  int? price;
  List<ItemModel>? accessoriesList;
  List<ItemModel>? extrasList;

  ProductModels({
    this.id,
    this.title,
    this.price,
    this.accessoriesList,
    this.extrasList,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
        id: json["id"],
        title: json["title"],
        price: json["price"],
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
        "price_accessories": accessoriesList == null
            ? []
            : List<dynamic>.from(accessoriesList!.map((x) => x.toJson())),
        "price_extra": extrasList == null
            ? []
            : List<dynamic>.from(extrasList!.map((x) => x.toJson())),
      };
}

class ItemModel {
  int? id;
  String? title;
  int? price;
  int? status;

  ItemModel({
    this.id,
    this.title,
    this.price,
    this.status,
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
