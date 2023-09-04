// To parse this JSON data, do
//
//     final searchResultResModel = searchResultResModelFromJson(jsonString);

import 'dart:convert';

SearchResultResModel searchResultResModelFromJson(String str) =>
    SearchResultResModel.fromJson(json.decode(str));

String searchResultResModelToJson(SearchResultResModel data) =>
    json.encode(data.toJson());

class SearchResultResModel {
  String? status;
  List<SearchDataModel>? searchDataList;

  SearchResultResModel({
    this.status,
    this.searchDataList,
  });

  factory SearchResultResModel.fromJson(Map<String, dynamic> json) =>
      SearchResultResModel(
        status: json["status"],
        searchDataList: json["data"] == null
            ? []
            : List<SearchDataModel>.from(
                json["data"]!.map((x) => SearchDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": searchDataList == null
            ? []
            : List<dynamic>.from(searchDataList!.map((x) => x.toJson())),
      };
}

class SearchDataModel {
  int? id;
  String? title;
  String? slug;
  String? transCategorySlug;
  String? transMainCategorySlug;
  String? searchType;

  SearchDataModel({
    this.id,
    this.title,
    this.slug,
    this.transCategorySlug,
    this.transMainCategorySlug,
    this.searchType,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) =>
      SearchDataModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        transCategorySlug: json["trans_category_slug"],
        transMainCategorySlug: json["trans_main_category_slug"],
        searchType: json["search_type"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "trans_category_slug": transCategorySlug,
        "trans_main_category_slug": transMainCategorySlug,
        "search_type": searchType,
      };
}
