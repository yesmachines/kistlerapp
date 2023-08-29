// import 'package:flutter/material.dart';
// import 'package:kistler/core/constants.dart/color.dart';

// class MainPageTable extends StatelessWidget {
//   final List<Map<dynamic, dynamic>> data;
//   const MainPageTable({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 800,
//         child: Table(
//           border: TableBorder.all(color: ColorConstant.kistlerBrandGreen),
//           defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//           columnWidths: {
//             0: FlexColumnWidth(2),
//             1: FlexColumnWidth(4),
//             2: FlexColumnWidth(3),
//             3: FlexColumnWidth(3),
//             4: FlexColumnWidth(3),
//             5: FlexColumnWidth(3),
//           },
//           children: [
//             TableRow(
//               decoration: BoxDecoration(color: ColorConstant.kistlerBrandGreen),
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       "Model No",
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: ColorConstant.kistlerWhite),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Workpiece diameter - min. (inch)',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: ColorConstant.kistlerWhite),
//                         textAlign: TextAlign.center),
//                   ),
//                 ),
//                 TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Workpiece diameter - max. (inch)',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: ColorConstant.kistlerWhite),
//                         textAlign: TextAlign.center),
//                   ),
//                 ),
//                 TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Torch stroke (Inch)',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: ColorConstant.kistlerWhite),
//                         textAlign: TextAlign.center),
//                   ),
//                 ),
//                 TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Through-hole (inch)',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: ColorConstant.kistlerWhite),
//                         textAlign: TextAlign.center),
//                   ),
//                 ),
//                 TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Cutting speed (inch/min)',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: ColorConstant.kistlerWhite),
//                         textAlign: TextAlign.center),
//                   ),
//                 ),
//               ],
//             ),
//             for (var row in data)
//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(row['no'], textAlign: TextAlign.center),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: SizedBox(
//                           width: 50,
//                           child:
//                               Text(row['name'], textAlign: TextAlign.center)),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(row['price'], textAlign: TextAlign.center),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(row['qty'], textAlign: TextAlign.center)),
//                   ),
//                   TableCell(
//                     child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(row['qty'], textAlign: TextAlign.center)),
//                   ),
//                   TableCell(
//                     child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child:
//                             Text(row['cutting'], textAlign: TextAlign.center)),
//                   ),
//                 ],
//               ),
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/product_details_screen/controller/product_details_screen_controller.dart';
import 'package:provider/provider.dart';

class MainPageTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final List<String> columnTitles;
  final List<String> keyList;

  const MainPageTable(
      {Key? key,
      this.data = const [],
      this.columnTitles = const [],
      this.keyList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data.length.toString() + "hola error1");
    print(keyList.length.toString() + "hola error2");
    print(columnTitles.length.toString() + "hola error3");
    final provider = Provider.of<ProductDetailsScreenController>(context);
    // if ( data.isNotEmpty) {
    //   keyList =  data.first.keys.toList();
    //   // if (keyList.length > columnTitles.length) {
    //   //   columnTitles.insert(0, "Model Number");
    //   // }
    // }
    return provider.isLoading
        ? ReusableLoadingIndicator()
        : data.isEmpty
            ? SizedBox()
            : SizedBox(
                width: keyList.length > 8 ? 1400 : 800,
                child: Table(
                  border: TableBorder.all(
                      color: ColorConstant
                          .kistlerBrandGreen), // Change to your color
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    for (var i = 0; i < columnTitles.length; i++)
                      i: FlexColumnWidth(3),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                          color: ColorConstant
                              .kistlerBrandGreen), // Change to your color
                      children: [
                        for (var title in columnTitles)
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Change to your color
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    for (var row in data)
                      TableRow(
                        children: [
                          for (var title in keyList)
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  row[title] != null
                                      ? row[title].toString()
                                      : '',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              );
  }
}
