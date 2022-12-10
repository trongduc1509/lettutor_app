import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width =
        Platform.isAndroid ? 238.0 : MediaQuery.of(context).size.width * 0.57;
    final height = Platform.isAndroid ? 52.0 : width * 13 / 59;
    final top = MediaQuery.of(context).size.height * 0.3772;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: top),
        child: Image.asset(
          Assets.images.lettutorLogo.path,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
