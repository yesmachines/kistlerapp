import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';
import 'package:kistler/repository/api/price_screen/services/price_screen_services.dart';

class PriceScreenController extends ChangeNotifier {
  bool isLoading = false;

  List<ProductModels> modelsList = [];
  PriceDetailsResModel? prosuctDetails;

  Future<bool> getProductPriceDetails(
      {required Locale language, required String productId}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await PriceScreenServices()
          .getProductPriceDetails(language: language, productId: productId);
      if (fetchedData.error != true) {
        PriceDetailsResModel resData = fetchedData.data;
        prosuctDetails = resData;

        modelsList = resData.productM0delsList ?? [];

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

  void toggleSelection(int productId) {
    print(productId);
    final productIndex =
        modelsList.indexWhere((product) => product.id == productId);
    print(productIndex);
    if (productIndex != -1) {
      print(modelsList[productIndex].isSelected);
      modelsList[productIndex].isSelected =
          !modelsList[productIndex].isSelected;

      // Update the quantity based on selection status
      modelsList[productIndex].quantity =
          modelsList[productIndex].isSelected ? 1 : 0;

      notifyListeners();
    }
  }

  void toggleAccessorySelection(
      {required int productId, required int accessoryId}) {
    final productIndex =
        modelsList.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      final accessoryIndex = modelsList[productIndex]
          .accessoriesList
          .indexWhere((accessory) => accessory.id == accessoryId);
      if (accessoryIndex != -1) {
        modelsList[productIndex].accessoriesList[accessoryIndex].isSelected =
            !modelsList[productIndex]
                .accessoriesList[accessoryIndex]
                .isSelected;

        // Update the accessory's quantity based on selection status
        modelsList[productIndex].accessoriesList[accessoryIndex].quantity =
            modelsList[productIndex].accessoriesList[accessoryIndex].isSelected
                ? 1
                : 0;

        notifyListeners();
      }
    }
  }

  void toggleFittingSelection(
      {required int productId, required int fittingId}) {
    final productIndex =
        modelsList.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      final fittingIndex = modelsList[productIndex]
          .extrasList
          .indexWhere((fitting) => fitting.id == fittingId);
      if (fittingIndex != -1) {
        modelsList[productIndex].extrasList[fittingIndex].isSelected =
            !modelsList[productIndex].extrasList[fittingIndex].isSelected;

        // Update the fitting's quantity based on selection status
        modelsList[productIndex].extrasList[fittingIndex].quantity =
            modelsList[productIndex].extrasList[fittingIndex].isSelected
                ? 1
                : 0;

        notifyListeners();
      }
    }
  }

  void updateQuantity({required int productId, required int newQuantity}) {
    final productIndex =
        modelsList.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      modelsList[productIndex].quantity = newQuantity;
      notifyListeners();
    }
  }

  void updateAccessoryQuantity(
      {required int productId,
      required int accessoryId,
      required int newQuantity}) {
    final productIndex =
        modelsList.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      final accessoryIndex = modelsList[productIndex]
          .accessoriesList
          .indexWhere((accessory) => accessory.id == accessoryId);
      if (accessoryIndex != -1) {
        modelsList[productIndex].accessoriesList[accessoryIndex].quantity =
            newQuantity;
        notifyListeners();
      }
    }
  }

  void updateFittingQuantity(
      {required int productId,
      required int fittingId,
      required int newQuantity}) {
    final productIndex =
        modelsList.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      final fittingIndex = modelsList[productIndex]
          .extrasList
          .indexWhere((fitting) => fitting.id == fittingId);
      if (fittingIndex != -1) {
        modelsList[productIndex].extrasList[fittingIndex].quantity =
            newQuantity;
        notifyListeners();
      }
    }
  }

  double calculateTotalPrice() {
    double total = 0.0;

    for (final product in modelsList) {
      total += product.price * product.quantity;

      for (final accessory in product.accessoriesList) {
        total += accessory.price * accessory.quantity;
      }

      for (final fitting in product.extrasList) {
        total += fitting.price * fitting.quantity;
      }
    }
    return total;
  }

  // String generateJsonData() {
  //   final jsonData = {
  //     'total_price': calculateTotalPrice(),
  //     'selectedmodelsList': modelsList
  //         .map((product) {
  //           final selectedAccessories = product.accessories
  //               .where((accessory) => accessory.isSelected)
  //               .map((accessory) {
  //             return {
  //               'id': accessory.id,
  //               'title': accessory.title,
  //               'price': accessory.price,
  //               'quantity': accessory.quantity,
  //             };
  //           }).toList();

  //           final selectedFittings = product.extraFittings
  //               .where((fitting) => fitting.isSelected)
  //               .map((fitting) {
  //             return {
  //               'id': fitting.id,
  //               'title': fitting.title,
  //               'price': fitting.price,
  //               'quantity': fitting.quantity,
  //             };
  //           }).toList();

  //           if (selectedAccessories.isEmpty && selectedFittings.isEmpty) {
  //             return null; // Exclude the product from JSON if no accessories or fittings are selected
  //           }

  //           return {
  //             'id': product.id,
  //             'title': product.title,
  //             'price': product.price,
  //             'quantity': product.quantity,
  //             'accessories': selectedAccessories,
  //             'extra_fittings': selectedFittings,
  //           };
  //         })
  //         .where((data) => data != null)
  //         .toList(), // Remove null entries
  //   };

  //   return json.encode(jsonData);
  // }

  Map<String, dynamic> generateJsonData() {
    final Map<String, dynamic> jsonData = {
      'total_amount': calculateTotalPrice(),
      'product_price_list': modelsList
          .where((product) =>
              product.isSelected ||
              product.accessoriesList
                  .any((accessory) => accessory.isSelected) ||
              product.extrasList.any((fitting) => fitting.isSelected))
          .map((product) {
        final selectedAccessories = product.accessoriesList
            .where((accessory) => accessory.isSelected)
            .map((accessory) {
          return {
            'id': accessory.id,
            'title': accessory.title,
            'price': accessory.price,
            'quantity': accessory.quantity,
          };
        }).toList();

        final selectedFittings = product.extrasList
            .where((fitting) => fitting.isSelected)
            .map((fitting) {
          return {
            'id': fitting.id,
            'title': fitting.title,
            'price': fitting.price,
            'quantity': fitting.quantity,
          };
        }).toList();

        final productData = {
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'quantity': product.quantity,
        };

        if (selectedAccessories.isNotEmpty) {
          productData['price_accessories'] = selectedAccessories;
        } else {
          productData['price_accessories'] = [];
        }

        if (selectedFittings.isNotEmpty) {
          productData['price_extra'] = selectedFittings;
        } else {
          productData['price_extra'] = [];
        }

        return productData;
      }).toList(),
    };
    // print(jsonData);

    return jsonData;
  }
}
