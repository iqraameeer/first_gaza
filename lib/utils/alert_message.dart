import 'dart:ui';


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AlertMessage {
  static void showSnackBar(
      BuildContext context, String text, Duration duration, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'PlusJakartaSans'),
        ),
        //padding: const EdgeInsets.all(15),
        backgroundColor: color,
        elevation: 5,
        duration: duration,
        behavior: SnackBarBehavior.fixed,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),),
      ),
    );
  }
  static void showErrorDialog(BuildContext context, String title, String text) {
    AwesomeDialog(
      context: context,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      animType: AnimType.scale,
      customHeader: const Icon(Icons.cancel, color: Colors.red, size: 110,),
      title: title,
      desc: text,
      titleTextStyle: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
      descTextStyle: TextStyle(color: ColorsConstant.textColor, fontSize: 14, fontWeight: FontWeight.normal),
      buttonsTextStyle: const TextStyle(color: Colors.white),
      btnOkOnPress: () {
        Navigator.of(context);
      },
      btnOkColor: Colors.red,
    ).show();
  }
  static void showNoInternetDialog(BuildContext context, String text) {
    AwesomeDialog(
      context: context,
      dismissOnBackKeyPress: true,
      dismissOnTouchOutside: true,
      animType: AnimType.scale,
      customHeader: Icon(Icons.wifi_off, color: ColorsConstant.checkbox_txt, size: 80,),
      title: "No Internet Found!",
      desc: text,
      titleTextStyle: TextStyle(color: ColorsConstant.textColor, fontSize: 18, fontWeight:FontWeight.w500),
      descTextStyle: TextStyle(color: ColorsConstant.textColor, fontSize: 14, fontWeight: FontWeight.normal),
      buttonsTextStyle:  TextStyle(color: Colors.white),
      btnOkOnPress: () {
        Navigator.of(context);
      },
      btnOkColor: ColorsConstant.rememberme,
    ).show();
  }

}
