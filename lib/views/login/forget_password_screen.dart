import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/colors.dart';
import '../../Utils/m-padding.dart';
import '../../widget/radial_background.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      const RadialBackground(),
      SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(PaddingConstant.kpadding20),
                          child: ClipRect(
                            child: SizedBox.fromSize(
                                child: Image.asset(
                              'assets/images/login-logo.png',
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Center(
                            child: Card(
                                margin: const EdgeInsets.all(20.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "کیا آپ اپنا پاس ورڈ بھول گئے ہیں؟",
                                        style: TextStyle(
                                          fontFamily: "PlusJakartaSans",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: ColorsConstant.signintxt,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "اپنا پاس ورڈ دوبارہ حاصل کرنے کے لیے، براہ کرم  ہماری ایڈمن ٹیم کو نیچے دیے گئے نمبر پر کال کریں۔ وہ آپ کی اکاؤنٹ کی بحالی میں مدد کریں گے۔ ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: "PlusJakartaSans",
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () async {
                                          final Uri url = Uri(
                                              scheme: 'tel',
                                              path: '02119276897');
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            print('Cannot launch this URL');
                                          }
                                        },
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: const BoxDecoration(
                                              color: Colors
                                                  .green, // Call button color (Green)
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.call,
                                                color: Colors.white, size: 28),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        textAlign: TextAlign.start,
                                        "Call Admin",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConstant.signintxt,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                      ]))))),
    ]));
  }
}
