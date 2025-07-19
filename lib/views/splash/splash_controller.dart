import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/route_imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      print('issplash11: $isLoggedIn');

      if (isLoggedIn) {
        Get.offNamed(AppRoutes.bottomNavBar);
      } else {
        Get.offNamed(AppRoutes.welcome);
      }
    });
  }
}
