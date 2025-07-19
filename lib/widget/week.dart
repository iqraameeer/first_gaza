import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';

class WeekButton extends StatelessWidget {
  final int week;
  final bool isActive;
  final bool isBefore;
  final bool isDisabled;
  final VoidCallback? onTap;

  WeekButton({
    required this.week,
    required this.isActive,
    required this.isBefore,
    required this.isDisabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap, // Disable tap if the button is after the current week
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: isActive
                ? ColorsConstant.btnlogin // Orange for the active week
                : isBefore
                    ? Colors.white // White for previous weeks
                    : Colors.grey[300], // Disabled (gray) for future weeks
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Week\n$week',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive || isBefore ? Colors.white : Colors.grey, // Text color
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
