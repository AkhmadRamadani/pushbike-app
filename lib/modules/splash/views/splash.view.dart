import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/modules/splash/controllers/splash.controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorConst.gradientBlueDashboard,
        ),
        child: Center(
          child: Image.asset(
            AssetConst.logoSplash,
            width: 200,
          ),
        ),
      ),
    );
  }
}
