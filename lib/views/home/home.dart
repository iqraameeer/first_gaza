import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../config/route_imports.dart';
import '../../utils/week_content_list.dart';
import '../../widget/curved_clipper.dart';
import '../../widget/radial_background.dart';
import 'home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  const RadialBackground(),
                  SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipPath(
                                clipBehavior: Clip.antiAlias,
                                clipper: CurvedClipper(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: controller.gradientColors,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Text(
                                    controller.isPregnancyWeekSelected.value
                                        ? 'دوران حمل کی ہدایات'
                                        : ' بچے کی عمر :   ${controller.selectedChildWeekNumber.value} ہفتہ ',
                                    style: const TextStyle(
                                      fontFamily: 'AlQalamTajNastaleeqRegular',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Obx(() => Container(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          height: 70,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .getSelectableWeeks()
                                                .length,
                                            itemBuilder: (context, index) {
                                              final weekIndex = controller
                                                  .getSelectableWeeks()[index];
                                              final isSelectable = controller
                                                  .isWeekSelectable(weekIndex);
                                              final isSelected = controller
                                                      .selectedWeek.value ==
                                                  weekIndex;
                                              final isCurrentOrRegistrationWeek =
                                                  controller.isDelivered.value
                                                      ? (weekIndex ==
                                                              controller
                                                                  .currentWeek
                                                                  .value ||
                                                          weekIndex ==
                                                              controller
                                                                  .registrationWeekIndex
                                                                  .value)
                                                      : (weekIndex ==
                                                          controller
                                                              .registrationWeekIndex
                                                              .value);

                                              final isGreenWeek =
                                                  weekIndex >= 27 &&
                                                      weekIndex <= 50;

                                              // Determine background color or gradient
                                              Color backgroundColor;
                                              Gradient? gradientBackground;

                                              if (weekIndex < 3) {
                                                backgroundColor = (weekIndex ==
                                                        2)
                                                    ? const Color(0xFFCA52CC)
                                                    : const Color(0xFF2391C9);
                                              } else if (isGreenWeek) {
                                                gradientBackground =
                                                    const LinearGradient(
                                                  colors: [
                                                    Color(0xFF4EA51B),
                                                    Color(0xFF4EA51B)
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                );
                                                backgroundColor =
                                                    Colors.transparent;
                                              } else {
                                                backgroundColor =
                                                    const Color(0xFFC95F23);
                                              }

                                              // Use gradient for green weeks if selected or current/registration week
                                              bool showGradient = isGreenWeek &&
                                                  (isSelected ||
                                                      isCurrentOrRegistrationWeek);

                                              // Override background color for non-selected, non-current weeks
                                              if (!isSelected &&
                                                  !isCurrentOrRegistrationWeek) {
                                                backgroundColor = Colors.white;
                                                gradientBackground = null;
                                              }

                                              return GestureDetector(
                                                onTap: isSelectable
                                                    ? () {
                                                        controller
                                                            .updateSelectedWeek(
                                                                weekIndex);
                                                        print(
                                                            '🖱️ Week $weekIndex clicked and selected');
                                                      }
                                                    : () {
                                                        print(
                                                            '🚫 Week $weekIndex is not selectable and cannot be clicked');
                                                      },
                                                child: Container(
                                                  width: 60,
                                                  height: 64,
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  decoration: BoxDecoration(
                                                    color: showGradient
                                                        ? null
                                                        : backgroundColor,
                                                    gradient: showGradient
                                                        ? gradientBackground
                                                        : null,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: "Week\n",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: weekIndex < 3
                                                                ? "${35 + weekIndex}"
                                                                : "${weekIndex - 2}",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: isSelected
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: Image.asset(
                                      controller.imagePath,
                                      height: 100.0,
                                      width: 100.0,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Text('Image not found');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                await controller.loadInitialData();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'آج کی معلومات',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                          fontFamily:
                                              'AlQalamTajNastaleeqRegular',
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      Obx(
                                        () =>
                                            controller.selectedWeek.value >
                                                    controller.currentWeek.value
                                                ? const Text(
                                                    'کوئی معلومات موجود نہیں',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'NotoNastaliqUrdu',
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  )
                                                : ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: weeksContent[
                                                            controller
                                                                .selectedWeek
                                                                .value]
                                                        .days
                                                        .length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      // Get the days for the selected week
                                                      var days = weeksContent[
                                                              controller
                                                                  .selectedWeek
                                                                  .value]
                                                          .days;
                                                      final now =
                                                          DateTime.now();
                                                      final currentDay =
                                                          now.weekday;

                                                      // Create a list of indices sorted by day, prioritizing the current day
                                                      List<int>
                                                          sortedDayIndices =
                                                          List.generate(
                                                              days.length,
                                                              (i) => i);
                                                      sortedDayIndices
                                                          .sort((a, b) {
                                                        int dayA = controller
                                                            .daysToShow[a];
                                                        int dayB = controller
                                                            .daysToShow[b];

                                                        // If it's the current week, prioritize the current day
                                                        if (controller
                                                                .selectedWeek
                                                                .value ==
                                                            controller
                                                                .currentWeek
                                                                .value) {
                                                          if (dayA ==
                                                              currentDay)
                                                            return -1; // Current day first
                                                          if (dayB ==
                                                              currentDay)
                                                            return 1;
                                                          // Sort previous days in descending order
                                                          if (dayA <
                                                                  currentDay &&
                                                              dayB <
                                                                  currentDay) {
                                                            return dayB.compareTo(
                                                                dayA); // Reverse order for past days
                                                          }
                                                          // Future days come last, in ascending order
                                                          return dayA
                                                              .compareTo(dayB);
                                                        }
                                                        // For past or future weeks, use default order
                                                        return a.compareTo(b);
                                                      });

                                                      // Use the sorted index to get the correct day
                                                      int dayIndex =
                                                          sortedDayIndices[
                                                              index];
                                                      var day = days[dayIndex];
                                                      int dayNumber = controller
                                                          .daysToShow[dayIndex];

                                                      bool isPreviousDay = controller
                                                                  .selectedWeek
                                                                  .value <
                                                              controller
                                                                  .currentWeek
                                                                  .value ||
                                                          (controller.selectedWeek
                                                                      .value ==
                                                                  controller
                                                                      .currentWeek
                                                                      .value &&
                                                              dayNumber <
                                                                  now.weekday);
                                                      bool isToday = controller
                                                                  .selectedWeek
                                                                  .value ==
                                                              controller
                                                                  .currentWeek
                                                                  .value &&
                                                          dayNumber ==
                                                              now.weekday;
                                                      bool isPast11AM =
                                                          now.hour >= 11;
                                                      bool isTodayEnabled =
                                                          isToday && isPast11AM;
                                                      int uniqueId = controller
                                                              .isPregnancyWeekSelected
                                                              .value
                                                          ? controller
                                                                  .pregnancyIdBase +
                                                              controller
                                                                  .selectedPregnancyWeekNumber
                                                                  .value
                                                          : controller
                                                                  .childIdBase +
                                                              controller
                                                                  .selectedChildWeekNumber
                                                                  .value;
                                                      bool showContent =
                                                          isPreviousDay ||
                                                              isTodayEnabled;

                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 12),
                                                        child: GestureDetector(
                                                          onTap: showContent
                                                              ? () {
                                                                  print(
                                                                      'Week ${controller.selectedWeek.value}, Day $dayNumber (ID: $uniqueId) clicked');
                                                                  switch (
                                                                      uniqueId) {
                                                                    case 1035:
                                                                      Get.toNamed(
                                                                          AppRoutes
                                                                              .pregWeek35Detail,
                                                                          arguments: {
                                                                            'selectedDay':
                                                                                dayNumber
                                                                          });
                                                                      break;
                                                                    case 1036:
                                                                      Get.toNamed(
                                                                          AppRoutes
                                                                              .pregWeek36Detail,
                                                                          arguments: {
                                                                            'selectedDay':
                                                                                dayNumber
                                                                          });
                                                                      break;
                                                                    case 1037:
                                                                      Get.toNamed(
                                                                          AppRoutes
                                                                              .pregWeek37Detail,
                                                                          arguments: {
                                                                            'selectedDay':
                                                                                dayNumber
                                                                          });
                                                                      break;
                                                                    case 2001:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek01Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2002:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek02Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2003:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek03Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2004:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek04Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2005:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek05Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2006:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek06Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2007:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek07Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2008:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek08Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2009:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek09Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2010:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek10Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2011:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek11Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2012:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek12Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2013:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek13Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2014:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek14Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2015:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek15Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2016:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek16Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2017:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek17Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2018:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek18Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2019:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek19Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2020:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek20Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2021:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek21Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2022:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek22Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2023:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek23Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2024:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek24Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2025:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek25Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2026:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek26Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2027:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek27Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2028:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek28Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2029:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek29Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2030:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek30Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2031:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek31Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2032:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek32Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2033:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek33Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2034:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek34Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2035:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek35Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2036:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek36Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2037:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek37Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2038:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek38Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2039:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek39Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2040:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek40Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2041:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek41Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2042:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek42Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2043:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek43Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2044:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek44Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2045:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek45Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2046:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek46Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2047:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek47Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                    case 2048:
                                                                      Get.toNamed(
                                                                        AppRoutes
                                                                            .childWeek48Detail,
                                                                        arguments: {
                                                                          'selectedDay':
                                                                              dayNumber
                                                                        },
                                                                      );
                                                                      break;
                                                                  }
                                                                }
                                                              : null,
                                                          child: showContent
                                                              ? Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          12),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white, // or use Colors.transparent
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    boxShadow:
                                                                        isToday
                                                                            ? [
                                                                                BoxShadow(
                                                                                  color: controller.gradientColors.first.withOpacity(0.5),
                                                                                  blurRadius: 12,
                                                                                  spreadRadius: 2,
                                                                                  offset: const Offset(0, 6),
                                                                                ),
                                                                                BoxShadow(
                                                                                  color: controller.gradientColors.last.withOpacity(0.3),
                                                                                  blurRadius: 16,
                                                                                  spreadRadius: 1,
                                                                                  offset: const Offset(0, 10),
                                                                                ),
                                                                              ]
                                                                            : [],
                                                                  ),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        day.title,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w800,
                                                                          fontFamily:
                                                                              'NotoNastaliqUrdu',
                                                                          height:
                                                                              1.7,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.right,
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text.rich(
                                                                        TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: day.content,
                                                                              style: const TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: 'AlQalamTajNastaleeqRegular',
                                                                                height: 1.7,
                                                                              ),
                                                                            ),
                                                                            const TextSpan(
                                                                              text: ' مزید پڑھیں...',
                                                                              style: TextStyle(
                                                                                color: Colors.blue,
                                                                                fontSize: 18,
                                                                                fontFamily: 'AlQalamTajNastaleeqRegular',
                                                                                height: 1.7,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.right,
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
