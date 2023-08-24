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
  String selectedValue = 'Option 1';
  List<String> dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

  int selectedNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorConstant.kistlerBrandGreen),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(1.7),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2.5),
        4: FlexColumnWidth(1),
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
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showDropdown(context);
                },
                child: Row(
                  children: [
                    Text(
                      "100",
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            )),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '33510',
                ),
              ),
            ),
            TableCell(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Icon(
                    Icons.delete,
                    size: 20,
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
                    size: 20,
                  )),
            ),
          ],
        ),
      ],
    );
  }

  void showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an option'),
          content: DropdownButton<String>(
            value: selectedValue,
            items: dropdownOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) => SizedBox(),
          ),
        );
      },
    );
  }
}
