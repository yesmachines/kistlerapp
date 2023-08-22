import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class TableRowRefactor extends StatefulWidget {
  const TableRowRefactor({
    super.key,
  });

  @override
  State<TableRowRefactor> createState() => _TableRowRefactorState();
}

class _TableRowRefactorState extends State<TableRowRefactor> {
  int selectedNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorConstant.kistlerBrandGreen),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(1.7),
        1: FlexColumnWidth(2.9),
        2: FlexColumnWidth(1.8),
        3: FlexColumnWidth(2.5),
        4: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  'No',
                  style: TextStyle(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  'Qty',
                  style: TextStyle(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  'Price',
                  style: TextStyle(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Center(
                  child: Text(
                    'Dlt',
                    style: TextStyle(fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '01',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'SCM300',
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.kistlerBrandGreen)),
                      ),
                    ),
                  )),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '33 510',
                ),
              ),
            ),
            TableCell(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Icon(
                    Icons.delete,
                    size: 22,
                  )),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '01',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'SCM300',
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '33 510',
                ),
              ),
            ),
            TableCell(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Icon(
                    Icons.delete,
                    size: 22,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
