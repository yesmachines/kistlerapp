import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class QuantityInput extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  QuantityInput({required this.initialValue, required this.onChanged});

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
        widget.onChanged(_quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SCM300',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.delete,
                  color: ColorConstant.kistlerBrandGreen,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  color: ColorConstant.kistlerBrandGreen,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: ColorConstant.kistlerWhite,
                        ),
                        onPressed: _decrementQuantity,
                      ),
                      Text(
                        '$_quantity',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstant.kistlerWhite,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: ColorConstant.kistlerWhite,
                        ),
                        onPressed: _incrementQuantity,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Price : "),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.euro,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("35000"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
