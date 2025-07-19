import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final Widget content;
  final VoidCallback onTap; // Accept the onTap function as a parameter

   const CustomExpansionTile({super.key,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsConstant.whitecolor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget
                .onTap, // Trigger the onTap function passed as a parameter
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: ColorsConstant.btnlogin,
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      textDirection:
                      TextDirection.rtl, // RTL text support for Urdu
                      style: TextStyle(
                        fontFamily: 'Jameel Noori Nastaleeq',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.signintxt, // Custom text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
