import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigateTo({required Widget page, bool withHistory = true}) {
  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
      (route) => withHistory);
}
