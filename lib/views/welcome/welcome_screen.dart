import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/welcome_card.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final startPosition = (screenHeight - kToolbarHeight) / 2 - 50;
    final endPosition = screenHeight * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          const RadialBackground(),

          // Animated logo using TweenAnimationBuilder
          TweenAnimationBuilder<double>(
            tween: Tween(begin: startPosition, end: endPosition),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Positioned(
                top: value,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: ClipRect(
                    child: SizedBox.fromSize(
                      child: Image.asset(
                        'assets/images/login-logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: WelcomeCard(),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("Tapped Privacy Policy");
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: ColorsConstant.btnlogin,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          print("Tapped Terms");
                        },
                        child: Text(
                          'Terms of Service',
                          style: TextStyle(
                            color: ColorsConstant.btnlogin,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
