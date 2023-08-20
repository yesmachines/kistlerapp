import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class MainPageTable extends StatelessWidget {
  final List<Map<dynamic, dynamic>> data;
  const MainPageTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        child: Table(
          border: TableBorder.all(color: ColorConstant.kistlerBrandGreen),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(4),
            2: FlexColumnWidth(3),
            3: FlexColumnWidth(3),
            4: FlexColumnWidth(3),
            5: FlexColumnWidth(3),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: ColorConstant.kistlerBrandGreen),
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Model No",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.kistlerWhite),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Workpiece diameter - min. (inch)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.kistlerWhite),
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Workpiece diameter - max. (inch)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.kistlerWhite),
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Torch stroke (Inch)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.kistlerWhite),
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Through-hole (inch)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.kistlerWhite),
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Cutting speed (inch/min)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.kistlerWhite),
                        textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
            for (var row in data)
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(row['no'], textAlign: TextAlign.center),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 50,
                          child:
                              Text(row['name'], textAlign: TextAlign.center)),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(row['price'], textAlign: TextAlign.center),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(row['qty'], textAlign: TextAlign.center)),
                  ),
                  TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(row['qty'], textAlign: TextAlign.center)),
                  ),
                  TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Text(row['cutting'], textAlign: TextAlign.center)),
                  ),
                ],
              ),
          ],
        ));
  }
}
