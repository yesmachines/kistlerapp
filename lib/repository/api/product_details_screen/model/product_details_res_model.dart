import 'dart:convert';

ProductDetailsResModel productDetailsResModelFromJson(String str) =>
    ProductDetailsResModel.fromJson(json.decode(str));

String productDetailsResModelToJson(ProductDetailsResModel data) =>
    json.encode(data.toJson());

class ProductDetailsResModel {
  String? link;
  SpecDataArr? specDataArr;
  List<ProductTechnicalDiagram>? productTechnicalDiagrams;
  Products? products;
  List<ProductImage>? productImages;
  List<ProductSpecification>? productSpecifications;
  List<ProductAccessory>? productAccessories;
  CategoriesName? categoriesName;
  List<dynamic>? productVideos;
  List<ApplicationproductImage>? productApplicationImages;
  ProductPdf? productPdf;
  List<ProductSpecificationsModelNo>? productSpecificationsModelNo;

  ProductDetailsResModel({
    this.link,
    this.specDataArr,
    this.productTechnicalDiagrams,
    this.products,
    this.productImages,
    this.productSpecifications,
    this.productAccessories,
    this.categoriesName,
    this.productVideos,
    this.productApplicationImages,
    this.productPdf,
    this.productSpecificationsModelNo,
  });

  factory ProductDetailsResModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsResModel(
        link: json["link"],
        specDataArr: json["spec_data_arr"] == null
            ? null
            : SpecDataArr.fromJson(json["spec_data_arr"]),
        productTechnicalDiagrams: json["product_technical_diagrams"] == null
            ? []
            : List<ProductTechnicalDiagram>.from(
                json["product_technical_diagrams"]!
                    .map((x) => ProductTechnicalDiagram.fromJson(x))),
        products: json["products"] == null
            ? null
            : Products.fromJson(json["products"]),
        productImages: json["product_images"] == null
            ? []
            : List<ProductImage>.from(
                json["product_images"]!.map((x) => ProductImage.fromJson(x))),
        productSpecifications: json["product_specifications"] == null
            ? []
            : List<ProductSpecification>.from(json["product_specifications"]!
                .map((x) => ProductSpecification.fromJson(x))),
        productAccessories: json["product_accessories"] == null
            ? []
            : List<ProductAccessory>.from(json["product_accessories"]!
                .map((x) => ProductAccessory.fromJson(x))),
        categoriesName: json["categories"] == null
            ? null
            : CategoriesName.fromJson(json["categories"]),
        productVideos: json["product_videos"] == null
            ? []
            : List<dynamic>.from(json["product_videos"]!.map((x) => x)),
        productApplicationImages: json["product_application_images"] == null
            ? []
            : List<ApplicationproductImage>.from(
                json["product_application_images"]!
                    .map((x) => ApplicationproductImage.fromJson(x))),
        productPdf: json["product_pdf"] == null
            ? null
            : ProductPdf.fromJson(json["product_pdf"]),
        productSpecificationsModelNo:
            json["product_specifications_model_no"] == null
                ? []
                : List<ProductSpecificationsModelNo>.from(
                    json["product_specifications_model_no"]!
                        .map((x) => ProductSpecificationsModelNo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "spec_data_arr": specDataArr,
        "product_technical_diagrams": productTechnicalDiagrams == null
            ? []
            : List<dynamic>.from(
                productTechnicalDiagrams!.map((x) => x.toJson())),
        "products": products?.toJson(),
        "product_images": productImages == null
            ? []
            : List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "product_specifications": productSpecifications == null
            ? []
            : List<dynamic>.from(productSpecifications!.map((x) => x.toJson())),
        "product_accessories": productAccessories == null
            ? []
            : List<dynamic>.from(productAccessories!.map((x) => x)),
        "categories": categoriesName?.toJson(),
        "product_videos": productVideos == null
            ? []
            : List<dynamic>.from(productVideos!.map((x) => x)),
        "product_application_images": productApplicationImages == null
            ? []
            : List<dynamic>.from(
                productApplicationImages!.map((x) => x.toJson())),
        "product_pdf": productPdf?.toJson(),
        "product_specifications_model_no": productSpecificationsModelNo == null
            ? []
            : List<dynamic>.from(
                productSpecificationsModelNo!.map((x) => x.toJson())),
      };
}

class CategoriesName {
  String? categoryTitle;

  CategoriesName({
    this.categoryTitle,
  });

  factory CategoriesName.fromJson(Map<String, dynamic> json) => CategoriesName(
        categoryTitle: json["category_title"],
      );

  Map<String, dynamic> toJson() => {
        "category_title": categoryTitle,
      };
}

class ProductImage {
  int? id;
  int? prodImageId;
  int? languageId;
  int? productId;
  String? imageUrl;
  String? imageType;
  String? title;
  int? priority;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? tImageAlt;

  ProductImage({
    this.id,
    this.prodImageId,
    this.languageId,
    this.productId,
    this.imageUrl,
    this.imageType,
    this.title,
    this.priority,
    this.createdAt,
    this.updatedAt,
    this.tImageAlt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        prodImageId: json["prod_image_id"],
        languageId: json["language_id"],
        productId: json["product_id"],
        imageUrl: json["image_url"],
        imageType: json["image_type"],
        title: json["title"],
        priority: json["priority"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tImageAlt: json["t_image_alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "prod_image_id": prodImageId,
        "language_id": languageId,
        "product_id": productId,
        "image_url": imageUrl,
        "image_type": imageType,
        "title": title,
        "priority": priority,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "t_image_alt": tImageAlt,
      };
}

class ProductPdf {
  String? title;
  String? catalogue;

  ProductPdf({
    this.title,
    this.catalogue,
  });

  factory ProductPdf.fromJson(Map<String, dynamic> json) => ProductPdf(
        title: json["title"],
        catalogue: json["catalogue"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "catalogue": catalogue,
      };
}

class ProductSpecification {
  int? id;
  int? specificationId;
  String? name;
  int? languageId;
  int? status;
  dynamic createdAt;
  dynamic updatedAt;
  String? specValue;
  String? tSpecTitle;
  String? tModelNo;
  String? tSpecificationType;

  ProductSpecification({
    this.id,
    this.specificationId,
    this.name,
    this.languageId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.specValue,
    this.tSpecTitle,
    this.tModelNo,
    this.tSpecificationType,
  });

  factory ProductSpecification.fromJson(Map<String, dynamic> json) =>
      ProductSpecification(
        id: json["id"],
        specificationId: json["specification_id"],
        name: json["name"],
        languageId: json["language_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        specValue: json["spec_value"],
        tSpecTitle: json["t_spec_title"],
        tModelNo: json["t_model_no"],
        tSpecificationType: json["t_specification_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "specification_id": specificationId,
        "name": name,
        "language_id": languageId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "spec_value": specValue,
        "t_spec_title": tSpecTitle,
        "t_model_no": tModelNo,
        "t_specification_type": tSpecificationType,
      };
}

class ProductSpecificationsModelNo {
  int? id;
  int? productId;
  int? specificationId;
  int? productSpecificationId;
  int? languageId;
  String? specValue;
  int? priority;
  String? modelNo;
  String? specificationType;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductSpecificationsModelNo({
    this.id,
    this.productId,
    this.specificationId,
    this.productSpecificationId,
    this.languageId,
    this.specValue,
    this.priority,
    this.modelNo,
    this.specificationType,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductSpecificationsModelNo.fromJson(Map<String, dynamic> json) =>
      ProductSpecificationsModelNo(
        id: json["id"],
        productId: json["product_id"],
        specificationId: json["specification_id"],
        productSpecificationId: json["product_specification_id"],
        languageId: json["language_id"],
        specValue: json["spec_value"],
        priority: json["priority"],
        modelNo: json["model_no"],
        specificationType: json["specification_type"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "specification_id": specificationId,
        "product_specification_id": productSpecificationId,
        "language_id": languageId,
        "spec_value": specValue,
        "priority": priority,
        "model_no": modelNo,
        "specification_type": specificationType,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Products {
  String? ttitle;
  String? tslug;
  String? tdescription;
  dynamic tsubtite;
  String? timageAlt;
  String? defaultImage;
  dynamic defaultVideo;
  int? categoryId;
  int? id;
  String? brandImage;
  String? brandTitle;

  Products({
    this.ttitle,
    this.tslug,
    this.tdescription,
    this.tsubtite,
    this.timageAlt,
    this.defaultImage,
    this.defaultVideo,
    this.categoryId,
    this.id,
    this.brandImage,
    this.brandTitle,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        ttitle: json["ttitle"],
        tslug: json["tslug"],
        tdescription: json["tdescription"],
        tsubtite: json["tsubtite"],
        timageAlt: json["timage_alt"],
        defaultImage: json["default_image"],
        defaultVideo: json["default_video"],
        categoryId: json["category_id"],
        id: json["id"],
        brandImage: json["brand_image"],
        brandTitle: json["brand_title"],
      );

  Map<String, dynamic> toJson() => {
        "ttitle": ttitle,
        "tslug": tslug,
        "tdescription": tdescription,
        "tsubtite": tsubtite,
        "timage_alt": timageAlt,
        "default_image": defaultImage,
        "default_video": defaultVideo,
        "category_id": categoryId,
        "id": id,
        "brand_image": brandImage,
        "brand_title": brandTitle,
      };
}

class SpecDataArr {
  List<String> specTitles;
  List<Map<String, dynamic>> specData;

  SpecDataArr({required this.specTitles, required this.specData});

  factory SpecDataArr.fromJson(Map<String, dynamic> json) {
    final specTitles = List<String>.from(json['specTitles']);
    final specData = List<Map<String, dynamic>>.from(json['specData']);
    return SpecDataArr(specTitles: specTitles, specData: specData);
  }
}

class ApplicationproductImage {
  int? id;
  int? prodImageId;
  int? languageId;
  int? productId;
  String? imageUrl;
  String? imageType;
  String? title;
  int? priority;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? tImageAlt;

  ApplicationproductImage({
    this.id,
    this.prodImageId,
    this.languageId,
    this.productId,
    this.imageUrl,
    this.imageType,
    this.title,
    this.priority,
    this.createdAt,
    this.updatedAt,
    this.tImageAlt,
  });

  factory ApplicationproductImage.fromJson(Map<String, dynamic> json) =>
      ApplicationproductImage(
        id: json["id"],
        prodImageId: json["prod_image_id"],
        languageId: json["language_id"],
        productId: json["product_id"],
        imageUrl: json["image_url"],
        imageType: json["image_type"]!,
        title: json["title"]!,
        priority: json["priority"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tImageAlt: json["t_image_alt"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "prod_image_id": prodImageId,
        "language_id": languageId,
        "product_id": productId,
        "image_url": imageUrl,
        "image_type": imageType,
        "title": title,
        "priority": priority,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "t_image_alt": tImageAlt,
      };
}

class ProductAccessory {
  String? itemNo;
  String? iconUrl;
  String? tAccessTitle;
  String? tAccessDescription;
  dynamic tAccessImageAlt;

  ProductAccessory({
    this.itemNo,
    this.iconUrl,
    this.tAccessTitle,
    this.tAccessDescription,
    this.tAccessImageAlt,
  });

  factory ProductAccessory.fromJson(Map<String, dynamic> json) =>
      ProductAccessory(
        itemNo: json["item_no"],
        iconUrl: json["icon_url"],
        tAccessTitle: json["t_access_title"],
        tAccessDescription: json["t_access_description"],
        tAccessImageAlt: json["t_access_image_alt"],
      );

  Map<String, dynamic> toJson() => {
        "item_no": itemNo,
        "icon_url": iconUrl,
        "t_access_title": tAccessTitle,
        "t_access_description": tAccessDescription,
        "t_access_image_alt": tAccessImageAlt,
      };
}

class ProductTechnicalDiagram {
  String? ff;
  String? skdjos;
  int? id;
  int? prodImageId;
  int? languageId;
  int? productId;
  String? imageUrl;
  String? imageType;
  String? title;
  int? priority;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? tImageAlt;

  ProductTechnicalDiagram({
    this.ff,
    this.skdjos,
    this.id,
    this.prodImageId,
    this.languageId,
    this.productId,
    this.imageUrl,
    this.imageType,
    this.title,
    this.priority,
    this.createdAt,
    this.updatedAt,
    this.tImageAlt,
  });

  factory ProductTechnicalDiagram.fromJson(Map<String, dynamic> json) =>
      ProductTechnicalDiagram(
        ff: json["ff"],
        skdjos: json["skdjos"],
        id: json["id"],
        prodImageId: json["prod_image_id"],
        languageId: json["language_id"],
        productId: json["product_id"],
        imageUrl: json["image_url"],
        imageType: json["image_type"],
        title: json["title"],
        priority: json["priority"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tImageAlt: json["t_image_alt"],
      );

  Map<String, dynamic> toJson() => {
        "ff": ff,
        "skdjos": skdjos,
        "id": id,
        "prod_image_id": prodImageId,
        "language_id": languageId,
        "product_id": productId,
        "image_url": imageUrl,
        "image_type": imageType,
        "title": title,
        "priority": priority,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "t_image_alt": tImageAlt,
      };
}
