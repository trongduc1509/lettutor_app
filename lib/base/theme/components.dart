import 'package:custom_state/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_app/base/theme/colors.dart';

abstract class Component {
  static TextStyle get t16Bold => const TextStyle(
      // fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      height: 1.26);

  static ButtonStyle get progressButton => StateButton.styleFrom(
      textStyle: t16Bold,
      primary: AppColor().blueButton,
      onPrimary: Colors.white,
      onSurface: AppColor().blueButton,
      success: Colors.greenAccent,
      onSuccess: Colors.white,
      fail: Colors.red.shade100,
      onFail: Colors.redAccent,
      disable: const Color(0xFFC2C2C2),
      onDisable: Colors.white,
      minimumSize: const Size.fromHeight(46));
}
