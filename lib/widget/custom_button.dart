import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final String fontFamily;
  final bool isLoginButton;

  const CustomButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    required this.fontFamily,
    required this.isLoginButton,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        minimumSize: Size(
          widget.width ?? double.minPositive,
          widget.height ?? double.minPositive,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: widget.onPressed,
      child:  Text(
        widget.text,
        style: TextStyle(color: widget.textColor, fontSize: widget.isLoginButton ? 16 : 22, fontWeight: widget.isLoginButton ? FontWeight.bold : FontWeight.w500, fontFamily: widget.fontFamily,letterSpacing: widget.isLoginButton ? 1 : 0),
      textAlign: TextAlign.center,
      ),
    );
  }
}
