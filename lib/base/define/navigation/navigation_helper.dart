import 'package:flutter/cupertino.dart';

class NavigationHelper {
  static void popToRoot(BuildContext context) =>
      Navigator.of(context).popUntil((route) => route.isFirst);

  static void pop(
    BuildContext context, {
    int count = 1,
  }) {
    var _count = 0;
    Navigator.of(context).popUntil((route) => _count++ >= count);
  }
}
