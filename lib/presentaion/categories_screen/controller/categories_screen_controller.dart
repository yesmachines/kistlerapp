// CategoriesScreenServices

import 'package:flutter/material.dart';
import 'package:kistler/repository/api/categories_screen/models/get_all_products_res_model.dart';
import 'package:kistler/repository/api/categories_screen/services/categories_screen_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesScreenController extends ChangeNotifier {
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  ProductsByCategoryresModel? allProductsData;
  List<Category> allCategoriesList = [];
  List<Category> cuttingsProductsList = [];
  List<Category> weldingProductsList = [];

  // to Fetch the Course demo videos

  Future<bool> getAllProducts(
      {required Locale language, String? categoryId}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await CategoriesScreenServices()
          .getProductsByCategories(language: language, categoryId: categoryId);
      if (fetchedData.error != true) {
        allProductsData = fetchedData.data;
        if (allProductsData != null) {
          allCategoriesList = allProductsData!.categoriesList ?? [];
        }

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

  Future<bool> getCuttingProductsLidt({required Locale language}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();
// , categoryId: "166"
    try {
      // need to update values from  user input
      final fetchedData = await CategoriesScreenServices()
          .getProductsByCategories(language: language, categoryId: "166");
      if (fetchedData.error != true) {
        allProductsData = fetchedData.data;
        if (allProductsData != null) {
          cuttingsProductsList = allProductsData!.categoriesList ?? [];
        }

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

  Future<bool> getWeldingProductsLidt({required Locale language}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();
// , categoryId: "165"
    try {
      // need to update values from  user input
      final fetchedData = await CategoriesScreenServices()
          .getProductsByCategories(language: language, categoryId: "165");
      if (fetchedData.error != true) {
        allProductsData = fetchedData.data;
        if (allProductsData != null) {
          weldingProductsList = allProductsData!.categoriesList ?? [];
        }

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
