import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

import '../../../global_widgets/searchbar/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(color: colorConstant.kistlerWhite, boxShadow: [
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
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: .4, color: colorConstant.kistlerGridBoeder),
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 80,
                            child: Image.asset("assets/images/logo.png")),
                        Center(
                          child: Container(
                              height: 100,
                              child: Image.asset("assets/images/item.png")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SCM 300",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: colorConstant.kistlerTextColor),
                            ),
                            Text(
                              "PLC-Controlled",
                              style: TextStyle(
                                  color: colorConstant.kistlerTextColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 20, // Number of items in the grid
            ),
          ),
        ),
      ],
    );
  }
}
