import 'package:flutter/material.dart';

class CommonController extends ChangeNotifier {
  /// This global key is used in material app for navigation through firebase notifications.
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
}
