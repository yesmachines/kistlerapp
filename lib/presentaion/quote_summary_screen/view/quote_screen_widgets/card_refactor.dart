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
          Row(
            children: [
              Text(
                "Accessories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstant.kistlerBrandGreen),
              borderRadius: BorderRadius.circular(8),
              color: ColorConstant.kistlerBrandlightGreen,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => AssessoriesContainer(),
            ),
          )
        ],
      ),
    );
  }
}

// todo here is the container used for assessories container
class AssessoriesContainer extends StatefulWidget {
  @override
  State<AssessoriesContainer> createState() => _AssessoriesContainerState();
}

class _AssessoriesContainerState extends State<AssessoriesContainer> {
  @override
  Widget build(BuildContext context) {
    int _quantity = 1;
    int initialValue = 1;

    @override
    void initState() {
      super.initState();
      _quantity = initialValue;
    }

    void _incrementQuantity() {
      setState(() {
        _quantity++;
      });
    }

    void _decrementQuantity() {
      setState(() {
        if (_quantity > 0) {
          _quantity--;
        }
      });
    }

    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Roller support frame to support...',
                style: TextStyle(
                  fontSize: 12,
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
                  Text("1200"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
