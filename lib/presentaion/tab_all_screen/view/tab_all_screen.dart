import 'package:flutter/material.dart';
import 'package:kistler/global_widgets/custom_product_container.dart';

class TabAllViewScreen extends StatelessWidget {
  const TabAllViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Cutter",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'PLC Controlled',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),
              ]),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: .8),
            itemBuilder: (BuildContext context, int index) {
              return ProductContainer();
            },
            itemCount: 9, // Number of items in the grid
          ),
        ],
      ),
    );
  }
}
