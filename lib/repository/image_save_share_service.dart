// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:share_plus/share_plus.dart';

class CardShareAndSaveServices {
  late Uint8List _imageBytes;

// to capture the widget
  Future<void> captureWidget(GlobalKey globalKey) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    if (boundary != null) {
      final image = await boundary.toImage(pixelRatio: 3);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

      _imageBytes = byteData!.buffer.asUint8List();
    }
  }

// to share the widget to other apps
  Future<void> shareWidgetAsImage(GlobalKey globalKey) async {
    await captureWidget(globalKey);

    if (_imageBytes.isNotEmpty) {
      final tempDir = await getTemporaryDirectory();
      final imagePath = '${tempDir.path}/widget.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(_imageBytes);

      await Share.shareFiles(
        [imagePath],
        text: '',
      );
    }
  }

  // to save the widget to gallery

  // Future<void> saveImageToGallery(
  //     GlobalKey globalKey, BuildContext context) async {
  //   await captureWidget(globalKey);

  //   if (_imageBytes.isNotEmpty) {
  //     final tempDir = await getTemporaryDirectory();
  //     final imagePath = '${tempDir.path}/widget.png';
  //     final imageFile = File(imagePath);
  //     await imageFile.writeAsBytes(_imageBytes);
  //     bool? isSaved = await GallerySaver.saveImage(imagePath);
  //     if (isSaved == true) {
  //       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       //   duration: const Duration(seconds: 2),
  //       //   margin: getPadding(all: 10),
  //       //   behavior: SnackBarBehavior.floating,
  //       //   content: Text(
  //       //     'Image saved to gallery',
  //       //     style: AppStyle.inter.copyWith(
  //       //         fontSize: 15,
  //       //         color: ColorConstant.white,
  //       //         fontWeight: FontWeight.w500),
  //       //   ),
  //       //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //       //   backgroundColor: ColorConstant.tealGreen,
  //       // ));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         duration: const Duration(seconds: 2),
  //         content: Text(
  //           'Failed to save image',
  //           style: AppStyle.inter.copyWith(
  //               fontSize: 15,
  //               color: ColorConstant.white,
  //               fontWeight: FontWeight.w500),
  //         ),
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //         backgroundColor: ColorConstant.red,
  //       ));
  //     }
  //   }
  // }
}
