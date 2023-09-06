import 'package:flutter/material.dart';
import 'package:kistler/repository/api/search_screen/models/serach_res_model.dart';
import 'package:kistler/repository/api/search_screen/services/search_screen_service.dart';

class SearchScreenController extends ChangeNotifier {
  // to make it default loading
  bool isLoading = false;
  List<SearchDataModel> searchList = [];
  List<SearchDataModel> searchedProductList = [];

  Future<bool> getSearchData(
      {required Locale language, required String searchText}) async {
    searchList = [];
    searchedProductList = [];
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await SearchScreenServices().getSearchResult(
          language: language, body: {"search_input": searchText});
      if (fetchedData.error != true) {
        searchList = [];
        searchedProductList = [];
        SearchResultResModel resData = fetchedData.data;
        searchList = resData.searchDataList ?? [];
        if (searchList.isNotEmpty) {
          for (final result in searchList) {
            if (result.searchType == "product") {
              searchedProductList.add(result);
            }
          }
          // searchedProductList =
          //     searchList.where((element) => element.searchType == "product")
          //         as List<SearchDataModel>;
        }
        print(searchedProductList.length.toString() + "resultlength");

        print(searchedProductList.length.toString() + "resultlength");

        print(resData);

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
