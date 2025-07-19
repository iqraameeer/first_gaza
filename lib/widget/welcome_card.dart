import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/Utils/responsive_size.dart';
import 'package:pehli_gaza_app/config/route_imports.dart';
import '../widget/custom_button.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'خوش آمدید!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NotoNastaliqUrdu',
                color: ColorsConstant.signintxt,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 30),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'پہلی غذا : بہتر والدین بننے کے سفر میں آپ کا ساتھی اور مددگار',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontFamily: 'JameelNoori',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'یہاں آپ کو ماں اور بچے کی غذا کے حوالے سے معلوماتی مواد اور عملی رہنمائی فراہم کی جائے گی تاکہ آپ اور ہم مل کر بچے کے لیے ایک مضبوط بنیاد رکھیں اور بہتر نشونما کو یقینی بنائیں',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontFamily: 'JameelNoori',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "آئیے شروع کریں",
              backgroundColor: ColorsConstant.btnlogin,
              textColor: Colors.white,
              width: ResponsiveSize.sizeWidth(context),
              height: 45,
              fontFamily: 'JameelNoori',
              isLoginButton: false,
              onPressed: () {
                Get.offNamed(AppRoutes.signin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
