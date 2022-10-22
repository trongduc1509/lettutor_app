import 'package:flutter/material.dart';

class DefaultStyle {
  DefaultStyle();

  /// Todo: Color
  Color get backgroundColor => const Color(0xFFFFFFFF);
  final Color red = const Color(0xFFF5222D);
  final Color blue = const Color(0xFF3E90F7);
  final Color greySecondary = const Color(0XFF7E7E7E);
  final Color blackTitle = const Color(0XFF222222);
  final Color greyDisable = const Color(0xffACACAC);
  final Color swatch = Colors.blue;
  final Color primary = const Color(0xFF0050B3);

  TextStyle get t10Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 10,
      fontStyle: FontStyle.normal);

  TextStyle get t10Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      fontStyle: FontStyle.normal);

  TextStyle get t10Bold => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w700,
      fontSize: 10,
      fontStyle: FontStyle.normal);

  TextStyle get t12Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t12Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t12Bold => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t13Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 13.5,
      fontStyle: FontStyle.normal);

  TextStyle get t13Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 13.5,
      fontStyle: FontStyle.normal);

  TextStyle get t13Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 13.5,
      fontStyle: FontStyle.normal);

  TextStyle get t14Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontStyle: FontStyle.normal);

  TextStyle get t14Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      height: 1.32);

  TextStyle get t14Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      height: 1.32);

  TextStyle get t14MediumV2 => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontStyle: FontStyle.normal);

  TextStyle get t14BoldWhite => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      height: 1.32);

  TextStyle get t16Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      height: 1.26);

  TextStyle get t16Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t16Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      height: 1.26);

  TextStyle get t16RegularWithoutHeight => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal);

  TextStyle get t20Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      fontStyle: FontStyle.normal);

  TextStyle get t20Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      fontStyle: FontStyle.normal);

  TextStyle get t20Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 20,
      fontStyle: FontStyle.normal);

  TextStyle get textInputStyle => t16Medium;

  TextStyle get linkedText => t14Bold.copyWith(color: blue);

  TextStyle get bodyText => t14Regular.copyWith(color: Colors.black);
}
