import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class PriceScreenTable extends StatefulWidget {
  final List<Map<dynamic, dynamic>> data;
  const PriceScreenTable({super.key, required this.data});

  @override
  State<PriceScreenTable> createState() => _PriceScreenTableState();
}

class _PriceScreenTableState extends State<PriceScreenTable> {
  bool _isChecked = false;
  int selectedNumber = 1;

  _toggleCheckbox(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Table(
        border: TableBorder.all(color: ColorConstant.kistlerBrandGreen),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(.8),
          1: FlexColumnWidth(1.6),
          2: FlexColumnWidth(1.1),
          3: FlexColumnWidth(.8),
          4: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'No',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Qty',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Select',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
          for (var row in widget.data)
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
                        child: Text(row['name'], textAlign: TextAlign.center)),
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
                    child: Checkbox(
                      activeColor: ColorConstant.kistlerBrandGreen,
                      value: _isChecked,
                      onChanged: (value) => setState(() {
                        _isChecked = value!;
                      }),
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
