// // To parse this JSON data, do
// //
// //     final gerProductByCategoryIdResModel = gerProductByCategoryIdResModelFromJson(jsonString);

// import 'dart:convert';

// GerProductByCategoryIdResModel gerProductByCategoryIdResModelFromJson(
//         String str) =>
//     GerProductByCategoryIdResModel.fromJson(json.decode(str));

// String gerProductByCategoryIdResModelToJson(
//         GerProductByCategoryIdResModel data) =>
//     json.encode(data.toJson());

// class GerProductByCategoryIdResModel {
//   String? status;
//   List<Category>? categoriesList;

//   GerProductByCategoryIdResModel({
//     this.status,
//     this.categoriesList,
//   });

//   factory GerProductByCategoryIdResModel.fromJson(Map<String, dynamic> json) =>
//       GerProductByCategoryIdResModel(
//         status: json["status"],
//         categoriesList: json["categories"] == null
//             ? []
//             : List<Category>.from(
//                 json["categories"]!.map((x) => Category.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "categories": categoriesList == null
//             ? []
//             : List<dynamic>.from(categoriesList!.map((x) => x.toJson())),
//       };
// }

// class Category {
//   int? id;
//   String? title;
//   String? slug;
//   String? iconUrl;
//   List<Subcategory>? subcategoriesList;

//   Category({
//     this.id,
//     this.title,
//     this.slug,
//     this.iconUrl,
//     this.subcategoriesList,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         iconUrl: json["icon_url"],
//         subcategoriesList: json["subcategories"] == null
//             ? []
//             : List<Subcategory>.from(
//                 json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "icon_url": iconUrl,
//         "subcategories": subcategoriesList == null
//             ? []
//             : List<dynamic>.from(subcategoriesList!.map((x) => x.toJson())),
//       };
// }

// class Subcategory {
//   int? id;
//   String? title;
//   String? slug;
//   String? iconUrl;
//   List<Product>? productsList;

//   Subcategory({
//     this.id,
//     this.title,
//     this.slug,
//     this.iconUrl,
//     this.productsList,
//   });

//   factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         iconUrl: json["icon_url"],
//         productsList: json["products"] == null
//             ? []
//             : List<Product>.from(
//                 json["products"]!.map((x) => Product.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "icon_url": iconUrl,
//         "products": productsList == null
//             ? []
//             : List<dynamic>.from(productsList!.map((x) => x.toJson())),
//       };
// }

// class Product {
//   String? ttitle;
//   String? tslug;
//   int? id;
//   String? defaultImage;
//   String? brandImage;
//   BrandTitle? brandTitle;

//   Product({
//     this.ttitle,
//     this.tslug,
//     this.id,
//     this.defaultImage,
//     this.brandImage,
//     this.brandTitle,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         ttitle: json["ttitle"],
//         tslug: json["tslug"],
//         id: json["id"],
//         defaultImage: json["default_image"],
//         brandImage: json["brand_image"],
//         brandTitle: brandTitleValues.map[json["brand_title"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "ttitle": ttitle,
//         "tslug": tslug,
//         "id": id,
//         "default_image": defaultImage,
//         "brand_image": brandImage,
//         "brand_title": brandTitleValues.reverse[brandTitle],
//       };
// }

// enum BrandTitle { BODE, KISTLER }

// final brandTitleValues =
//     EnumValues({"Bode": BrandTitle.BODE, "Kistler": BrandTitle.KISTLER});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
