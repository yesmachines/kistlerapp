// import 'package:flutter/material.dart';

// class SpecTable extends StatelessWidget {
//   final SpecModel specModel;

//   SpecTable({required this.specModel});

//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: specModel.specTitles.map((title) {
//         return DataColumn(label: Text(title));
//       }).toList(),
//       rows: specModel.specData.map((data) {
//         return DataRow(
//           cells: data.data.entries.map((entry) {
//             return DataCell(Text(entry.value.toString()));
//           }).toList(),
//         );
//       }).toList(),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('Spec Table')),
//       body: SpecTable(
//         specModel: SpecModel.fromJson(yourJsonData), // Replace with your JSON data
//       ),
//     ),
//   ));
// }
import 'package:flutter/widgets.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/repository/api/product_details_screen/model/product_details_res_model.dart';
import 'package:kistler/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class ProductDetailsScreenServices {
  Future<APIResponse> getProducteDetails(
      {required Locale language, required String productId}) async {
    try {
      print("languagecode ${language.languageCode}");
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/${language.languageCode}/products-details/$productId/",
          header: ApiHelper.getApiHeader(
              access: await AppUtils.getAccessKey())); // pass header token
      if (response.error) {
        return response;
      } else {
        ProductDetailsResModel redData =
            ProductDetailsResModel.fromJson(response.data);
        return APIResponse(data: redData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch products");
      // return APIResponse(
      //     data: 'res data', error: true, errorMessage: 'failed to fetch data');
      rethrow;
    }
  }
}
