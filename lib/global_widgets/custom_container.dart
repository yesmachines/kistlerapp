// import 'package:flutter/material.dart';
// import 'package:kistler/core/constants.dart/color.dart';
// import 'package:kistler/presentaion/product_details_screen/views/product_details_screen.dart';

// class ProductContainer extends StatelessWidget {
//   const ProductContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => ProductDetailsScreen())),
//       child: Container(
//         decoration: BoxDecoration(
//             border:
//                 Border.all(width: .4, color: ColorConstant.kistlerGridBoeder),
//             borderRadius: BorderRadius.circular(6)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 5,
//               ),
//               Container(
//                   width: 80, child: Image.asset("assets/images/logo.png")),
//               Center(
//                 child: Container(
//                     height: 100,
//                     child: Image.asset(
//                       "assets/images/item.png",
//                     )),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "SCM 300",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: ColorConstant.kistlerTextColor),
//                   ),
//                   Text(
//                     "PLC-Controlled",
//                     style: TextStyle(color: ColorConstant.kistlerTextColor),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
