import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';

class CheckBtn extends StatelessWidget {
  final String text;
  final Function()? onTap; // Make onTap function nullable
  const CheckBtn({
    Key? key,
    required this.text,
    this.onTap, // Change onTap to nullable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null
          ? () => onTap!()
          : null, // Check if onTap is not null before invoking it
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: ColorsConstant.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
