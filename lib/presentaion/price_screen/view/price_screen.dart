import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/price_screen/view/price_screen_widgets/expansion_tile_refactor.dart';
import 'package:kistler/presentaion/price_screen/view/price_screen_widgets/tables.dart';

class MyTable extends StatefulWidget {
  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  final List<Map<dynamic, dynamic>> data = [
    {
      "no": "1",
      "name":
          "Extra charge for 3rd controlled axis (allows beveling of end cuts), part no. 808800",
      "price": "\$10000",
      "qty": "1",
      "select": false
    },
    {"no": "2", "name": "Jane", "price": "\$10000", "qty": "1", "select": true},
    {"no": "3", "name": "Alex", "price": "\$10000", "qty": "1", "select": true},
    {
      "no": "3",
      "name": "Alex",
      "price": "\$10000",
      "qty": "1",
      "select": false
    },
    // Add more rows as needed
  ];
  final List<Map<dynamic, dynamic>> assData = [
    {
      "no": "1",
      "name": "Extra charge for 3rd cuts), part no. 808800",
      "price": "\$10000",
      "qty": "1",
      "select": false
    },
    {"no": "2", "name": "Jane", "price": "\$10000", "qty": "1", "select": true},
    {"no": "3", "name": "Alex", "price": "\$10000", "qty": "1", "select": true},
    {
      "no": "3",
      "name": "Alex",
      "price": "\$10000",
      "qty": "1",
      "select": false
    },
    // Add more rows as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              height: 180,
              width: 180,
              child: Image.network(
                "https://imgs.search.brave.com/diuwAGp0a3Kc82mymdXgtdXUWi9BvTlMfBKEkqGQjLU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9oaXBz/LmhlYXJzdGFwcHMu/Y29tL3ZhZGVyLXBy/b2QuczMuYW1hem9u/YXdzLmNvbS8xNjc5/NTA3MjY2LXJ5b2Jp/LTY0MWIzZjNjOTEx/ODMuanBnP2Nyb3A9/MXh3OjF4aDtjZW50/ZXIsdG9wJnJlc2l6/ZT05ODA6Kg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: Text(
              "Programmable Saddle Cutting Machines - SCM Series",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: ColorConstant.kistlerBrandGreen),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ExpansionTileRefactor(
            tilenumber: "01",
            tileName: "SCM300",
            data: data,
            assdata: assData,
          ),
          SizedBox(
            height: 10,
          ),
          ExpansionTileRefactor(
            tilenumber: "02",
            tileName: "SCM400",
            data: data,
            assdata: assData,
          ),
          SizedBox(
            height: 10,
          ),
          ExpansionTileRefactor(
            tilenumber: "03",
            tileName: "SCM630",
            data: data,
            assdata: assData,
          ),
          SizedBox(
            height: 200,
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 50, bottom: 20, right: 50),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstant.kistlerBrandGreen,
          ),
          child: Center(
              child: Text(
            "Add to quote",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: ColorConstant.kistlerWhite),
          )),
        ),
      ),
    );
  }
}
