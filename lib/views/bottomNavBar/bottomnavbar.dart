import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/views/videos/video_screen.dart';
import '../home/home.dart';

import '../library/library_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  DateTime? lastBackPressed;
  // Asset image paths for the bottom navigation bar
  List<String> assetImages = [
    'assets/images/home-icon.png',
    // 'assets/images/messages-icon.png',
    'assets/images/videos.png',
    'assets/images/Vector.png',
  ];

  // Text labels for each tab
  // List<String> labels = ['Home', 'Messages', 'Videos', 'Library'];
  List<String> labels = ['Home', 'Videos', 'Library'];

  int page = 0;

  List<Widget> pages = [
    Home(),
    VideoScreen(),
    LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          const doubleTapDuration = Duration(milliseconds: 500);

          if (lastBackPressed == null ||
              now.difference(lastBackPressed!) > doubleTapDuration) {
            lastBackPressed = now;
            return false;
          } else {
            _showQuitDialog(context);
            return false;
          }
        },
        child: Scaffold(
          body: pages[page], // Display the selected page
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: assetImages.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive
                  ? ColorsConstant.btnlogin
                  : ColorsConstant.bottombar_text;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Conditionally show an image above the icon if it is active
                  if (isActive)
                    Image.asset(
                      'assets/images/selection.png', // Your image path
                      height: 20, // Adjust the size as needed
                    ),
                  SizedBox(
                      height: isActive
                          ? 4
                          : 0), // Space between the image and icon when active
                  Image.asset(
                    assetImages[index],
                    color:
                        color, // Change the color of the image based on active state
                    height: 25, // Adjust the size according to your design
                  ),
                  const SizedBox(height: 5), // Space between icon and text
                  Text(
                    labels[index], // Add the corresponding label
                    style: TextStyle(
                      color: color, // Match the text color with icon state
                      fontSize: 12, // Adjust the font size
                    ),
                  ),
                ],
              );
            },
            activeIndex: page,
            height: 80,
            splashSpeedInMilliseconds: 100,
            gapLocation: GapLocation.none,
            onTap: (int tappedIndex) {
              setState(() {
                page = tappedIndex; // Update the selected page
              });
            },
          ),
        ));
  }

  void _showQuitDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      ' کیا آپ ایپ سے باہر جانا چاہتے ہیں؟',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'AlQalamTajNastaleeqRegular',
                        color: Colors.black87,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'جی نہیں',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'AlQalamTajNastaleeqRegular',
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0281C1),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'جی ہاں',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'AlQalamTajNastaleeqRegular',
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -35,
                child: Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.info,
                    color: Color(0xFF0281C1),
                    size: 70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
