import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/generated/locale_keys.g.dart';

import '../../../global_widgets/custom_product_container.dart';

class TabScreenCutter extends StatelessWidget {
  const TabScreenCutter({super.key});

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
                    LocaleKeys.plc_controlled.tr(),
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
                    LocaleKeys.cnc_controlled.tr(),
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
