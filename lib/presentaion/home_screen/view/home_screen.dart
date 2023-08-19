import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/custom_product_container.dart';

import '../../../global_widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(color: ColorConstant.kistlerWhite, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: Offset(1, 3),
            ),
          ]),
          height: 70,
          child: Center(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * .80,
              child: SearchBarRefactor(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: .8),
              itemBuilder: (BuildContext context, int index) {
                return ProductContainer();
              },
              itemCount: 20, // Number of items in the grid
            ),
          ),
        ),
      ],
    );
  }
}
