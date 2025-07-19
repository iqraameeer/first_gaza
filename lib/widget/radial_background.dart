import 'package:flutter/material.dart';

import '../utils/responsive_size.dart';

class RadialBackground extends StatelessWidget {
  const RadialBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveSize.sizeHeight(context),
      // padding: const EdgeInsets.only(top: 00, left: 20, right: 20),
      width: ResponsiveSize.sizeWidth(context),
      // color: Colors.transparent,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(189, 200, 211, 0.35),
          // Color.fromRGBO(0, 132, 187, 0.2),
          Color.fromRGBO(212, 223, 234, 0.65),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
    );
  }
}
