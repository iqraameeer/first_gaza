import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final Widget content;
  final Function onTap;

  const CustomExpansionTile({
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: ColorsConstant.whitecolor,
      decoration: BoxDecoration(
        color: ColorsConstant.whitecolor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // Removes the divider
          unselectedWidgetColor: Colors.black, // Sets the color of the icon
        ),
        child: ExpansionTile(
          title: Align(
            alignment: Alignment.centerRight, // Align text to the right
            child: Text(
              title,
              textDirection: TextDirection.rtl, // RTL text support for Urdu
              style: TextStyle(
                fontFamily: 'NotoNastaliqUrdu',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: ColorsConstant.signintxt, // Custom text color
              ),
            ),
          ),
          leading: Icon(Icons.arrow_back_ios,
              color: ColorsConstant.btnlogin), // Custom arrow icon on the left
          trailing: SizedBox.shrink(), // Explicitly remove the trailing icon
          // children: [
          //   Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: content,
          //   ),
          // ],
        ),
      ),
    );
  }
}
