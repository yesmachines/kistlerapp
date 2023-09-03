import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/presentaion/price_screen/controller/price_screen_controller.dart';
import 'package:kistler/repository/api/price_screen/models/price_details_res_model.dart';
import 'package:provider/provider.dart';

class CustomExtrasTableWidget extends StatefulWidget {
  final List<ItemModel> extraFittingsDataList;
  final int productId;

  const CustomExtrasTableWidget({
    super.key,
    required this.extraFittingsDataList,
    required this.productId,
  });

  @override
  State<CustomExtrasTableWidget> createState() =>
      _CustomExtrasTableWidgetState();
}

class _CustomExtrasTableWidgetState extends State<CustomExtrasTableWidget> {
  // bool _isChecked = false;
  int selectedNumber = 1;

  // _toggleCheckbox(bool value) {
  //   setState(() {
  //     _isChecked = value;
  //   });
  // }

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
          for (int index = 0;
              index < widget.extraFittingsDataList.length;
              index++)
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
                        child: Text(
                            widget.extraFittingsDataList[index].title ?? "N/a",
                            textAlign: TextAlign.center)),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "€ ${widget.extraFittingsDataList[index].price?.toString() ?? "N/a"}",
                        textAlign: TextAlign.center),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Checkbox(
                      activeColor: ColorConstant.kistlerBrandGreen,
                      value: widget.extraFittingsDataList[index].isSelected,
                      onChanged: (value) => setState(() {
                        Provider.of<PriceScreenController>(context,
                                listen: false)
                            .toggleFittingSelection(
                                productId: widget.productId,
                                fittingId:
                                    widget.extraFittingsDataList[index].id);
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
