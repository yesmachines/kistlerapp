import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';

class CustomTableWidget extends StatefulWidget {
  final List<ItemModel> dataList;
  const CustomTableWidget({super.key, required this.dataList});

  @override
  State<CustomTableWidget> createState() => _CustomTableWidgetState();
}

class _CustomTableWidgetState extends State<CustomTableWidget> {
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
                  child: Text('Select',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
          for (int index = 0; index < widget.dataList.length; index++)
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(index.toString(), textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 50,
                        child: Text(widget.dataList[index].title ?? "N/a",
                            textAlign: TextAlign.center)),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "€ ${widget.dataList[index].price?.toString() ?? "N/a"}",
                        textAlign: TextAlign.center),
                  ),
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

// import 'package:flutter/material.dart';

// class CustomTableWidgetWithCheckBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: 4, // Number of rows
//       itemBuilder: (context, rowIndex) {
//         return Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 1.0, color: Colors.grey),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               for (int i = 1; i <= 4; i++)
//                 Container(
//                   width: 70, // Adjust the width as needed
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Row ${rowIndex + 1}, Col $i',
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
