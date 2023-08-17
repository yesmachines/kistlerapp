import 'package:flutter/material.dart';

import '../../../global_widgets/custom_container.dart';

class TabScreenWelding extends StatelessWidget {
  const TabScreenWelding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(height: 20),

          // plc controlled designs
          //
          //
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
            itemCount: 5,
          ),

          //
          //
          // CNC Controlled
          //
          SizedBox(
            height: 20,
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
                    'CNC Controlled',
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
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}
