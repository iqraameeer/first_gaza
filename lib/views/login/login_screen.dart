import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/Utils/m-padding.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/login_field_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              //height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(PaddingConstant.kpadding20),
                    child: ClipRect(
                      child: SizedBox.fromSize(
                          // Image radius
                          child: Image.asset(
                        'assets/images/login-logo.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  LoginCard(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("Tapped");
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: ColorsConstant.btnlogin,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Terms of Service',
                          style: TextStyle(
                              color: ColorsConstant.btnlogin,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
