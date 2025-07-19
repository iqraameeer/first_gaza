import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.splash,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splashScreen-logo.png",
              scale: 2,
            ),
          ],
        ),
      ),
    );
  }
}
