// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class DeliveredWeekModel {
//   final int week;
//   final bool isDelivered;
//
//   DeliveredWeekModel(this.week, this.isDelivered);
// }
//
// class PregnancyWeekLogic extends StatefulWidget {
//   const PregnancyWeekLogic({super.key});
//
//   @override
//   State<PregnancyWeekLogic> createState() => _PregnancyWeekLogicState();
// }
//
// class _PregnancyWeekLogicState extends State<PregnancyWeekLogic> {
//   List<DeliveredWeekModel> pregnancyWeekList = [];
//   List<DeliveredWeekModel> childWeekList = [];
//   int currentWeekDay = 0;
//   late ScrollController _scrollController;
//   int? selectedPregnancyWeek;
//   int? selectedChildWeek;
//   int pregnancyWeek = 37;
//   int totalWeeks = 0;
//   bool isDelivered = false;
//   final List<int> daysToShow = [1, 3, 5];
//   int childWeek = 1;
//   int childtotalWeeks = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     generateWeekLists();
//     _scrollController = ScrollController();
//
//     DateTime currentDate = DateTime.now();
//     DateTime registrationDate = DateTime(2024, 9, 20);
//     print('Registration Date: ${registrationDate.toString().split(' ')[0]}');
//     DateTime dateOfDelivery = DateTime(2024, 11, 11);
//     print('DateOfDelivery Date: ${dateOfDelivery.toString().split(' ')[0]}');
// // Get and print the current weekday
//     int currentWeekday = currentDate.weekday;
//     print(
//         'Current Weekday: $currentWeekday'); // This will print 1 for Monday, 7 for Sunday
//     // Calculate weeks since registration
//     int weeksSinceRegistration =
//     calculateWeeksBetweenDates(registrationDate, currentDate);
//     totalWeeks = pregnancyWeek + weeksSinceRegistration;
//
//     print('totalWeeks: $totalWeeks');
//     // Check if pregnancy weeks are complete
//     isDelivered = totalWeeks > 43;
//     if (isDelivered) {
//       int weeksSinceDelivery =
//       calculateWeeksBetweenDates(dateOfDelivery, currentDate);
//       childtotalWeeks = childWeek + weeksSinceDelivery;
//       print('childtotalWeeks : ${childtotalWeeks}');
//       selectedChildWeek = childtotalWeeks;
//     } else {
//       selectedPregnancyWeek = totalWeeks;
//     }
//
//     // Scroll to the correct week
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       int currentIndex = isDelivered
//           ? childWeekList.indexWhere((week) => week.week == childtotalWeeks)
//           : pregnancyWeekList.indexWhere((week) => week.week == totalWeeks);
//
//       double scrollTo = currentIndex * 80.0;
//       _scrollController
//           .jumpTo(scrollTo - (MediaQuery.of(context).size.width / 2) + 30);
//     });
//   }
//
//   void generateWeekLists() {
//     pregnancyWeekList.clear();
//     childWeekList.clear();
//
//     // Pregnancy Weeks (35 to 43) with isDelivered as false
//     for (int i = 0; i <= 8; i++) {
//       pregnancyWeekList.add(DeliveredWeekModel(35 + i, false));
//     }
//
//     // Childbirth Weeks (1 to 58) with isDelivered as true
//     for (int i = 1; i <= 58; i++) {
//       childWeekList.add(DeliveredWeekModel(i, true));
//     }
//   }
//
//   int calculateWeeksBetweenDates(DateTime startDate, DateTime endDate) {
//     Duration difference = endDate.difference(startDate);
//     int weeks = (difference.inDays / 7).floor();
//     return weeks;
//   }
//
//   DateTime findCurrentWeekMonday(DateTime today) {
//     int weekday = today.weekday;
//     DateTime monday = today.subtract(Duration(days: weekday - 1));
//     return monday;
//   }
//
//   Map<String, int> getCurrentWeekNumberAndDay(DateTime date) {
//     DateTime firstDayOfYear = DateTime(date.year, 1, 1);
//     int differenceInDays = date.difference(firstDayOfYear).inDays;
//     int currentWeekNumber = (differenceInDays / 7).floor() + 1;
//     int currentWeekDay = date.weekday;
//     // print('Current Week Number: $currentWeekNumber');
//     print('Current Week Day: $currentWeekDay');
//     return {'weekNumber': currentWeekNumber, 'weekDay': currentWeekDay};
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Horizontal Week List'),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),
//           buildHorizontalList("Pregnancy Weeks", pregnancyWeekList,
//               isPregnancy: true),
//           const SizedBox(height: 20),
//           buildHorizontalList("Childbirth Weeks", childWeekList,
//               isPregnancy: false),
//           const SizedBox(height: 20),
//           if (selectedPregnancyWeek != null || selectedChildWeek != null)
//             buildDaysForSelectedWeek(
//                 selectedPregnancyWeek ?? selectedChildWeek!)
//         ],
//       ),
//     );
//   }
//
//   Widget buildHorizontalList(String title, List<DeliveredWeekModel> weekList,
//       {required bool isPregnancy}) {
//     return Column(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           height: 80,
//           child: ListView.builder(
//             controller: _scrollController,
//             scrollDirection: Axis.horizontal,
//             itemCount: weekList.length,
//             itemBuilder: (context, index) {
//               final item = weekList[index];
//               bool isCurrentWeek =
//                   item.week == (isPregnancy ? totalWeeks : childtotalWeeks);
//               bool isSelected =
//                   (isPregnancy ? selectedPregnancyWeek : selectedChildWeek) ==
//                       item.week;
//               bool isFutureWeek =
//                   item.week > (isPregnancy ? totalWeeks : childtotalWeeks);
//               bool isDisabled = isFutureWeek;
//
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: GestureDetector(
//                   onTap: isDisabled
//                       ? null
//                       : () {
//                     setState(() {
//                       if (isPregnancy) {
//                         selectedPregnancyWeek = item.week;
//                         selectedChildWeek = null; // Deselect child week
//                       } else {
//                         selectedChildWeek = item.week;
//                         selectedPregnancyWeek =
//                         null; // Deselect pregnancy week
//                       }
//                     });
//                     print(
//                         '${isPregnancy ? "Pregnancy" : "Childbirth"} Week ${item.week} clicked');
//                   },
//                   child: Container(
//                     width: 60,
//                     decoration: BoxDecoration(
//                       color: isSelected
//                           ? Colors.indigo
//                           : isCurrentWeek
//                           ? Colors.blueAccent
//                           : isDisabled
//                           ? Colors.grey[400]
//                           : Colors.grey[500],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${isPregnancy ? "Preg" : "Child"}\nWeek ${item.week}',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight:
//                           isDisabled ? FontWeight.normal : FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildDaysForSelectedWeek(int selectedWeek) {
//     // Determine if the selected week is in the childbirth phase or pregnancy phase
//     bool isChildbirthPhase = selectedWeek < 35 || selectedWeek > 43;
//     String phaseText = isChildbirthPhase ? "Childbirth" : "Pregnancy";
//     return Expanded(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: daysToShow.length,
//         itemBuilder: (context, index) {
//           int day = daysToShow[index];
//           bool isCurrentDay = selectedWeek == totalWeeks &&
//               day == currentWeekDay &&
//               isPast11AM();
//           bool isPastDay = selectedWeek < totalWeeks ||
//               (selectedWeek == totalWeeks && day < currentWeekDay);
//           bool isFutureDay =
//               (selectedWeek == totalWeeks || selectedWeek == childtotalWeeks) &&
//                   (day == currentWeekDay && !isPast11AM());
//
//           return Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: GestureDetector(
//               onTap: isFutureDay
//                   ? null
//                   : () {
//                 print('Day $day clicked in Week $selectedWeek');
//               },
//               child: Container(
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: isPastDay || isCurrentDay
//                       ? Colors.teal
//                       : isFutureDay
//                       ? Colors.grey[400]
//                       : Colors.grey[500],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '$phaseText Week $selectedWeek, Day $day',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   bool isPast11AM() {
//     DateTime now = DateTime.now();
//     DateTime elevenAM = DateTime(now.year, now.month, now.day, 11, 0);
//     return now.isAfter(elevenAM);
//   }
// }

//================================================================//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class DeliveredWeekModel {
//   final int week;
//   final bool isDelivered;
//
//   DeliveredWeekModel(this.week, this.isDelivered);
// }
//
// class PregnancyWeekLogic extends StatefulWidget {
//   const PregnancyWeekLogic({super.key});
//
//   @override
//   State<PregnancyWeekLogic> createState() => _PregnancyWeekLogicState();
// }
//
// class _PregnancyWeekLogicState extends State<PregnancyWeekLogic> {
//   List<DeliveredWeekModel> pregnancyWeekList = [];
//   List<DeliveredWeekModel> childWeekList = [];
//   List<DeliveredWeekModel> combinedWeekList = [];
//   int currentWeekDay = 0;
//   late ScrollController _scrollController;
//   int? selectedWeek;
//   int pregnancyWeek = 37;
//   int totalWeeks = 0;
//   bool isDelivered = false;
//   final List<int> daysToShow = [1, 3, 5];
//   int childWeek = 1;
//   int childtotalWeeks = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     generateWeekLists();
//     combinedWeekList = pregnancyWeekList + childWeekList;
//
//     _scrollController = ScrollController();
//
//     DateTime currentDate = DateTime.now();
//     DateTime registrationDate = DateTime(2024, 9, 20);
//     print(
//         'Pregnancy Week is: $pregnancyWeek\nRegistration Date is: ${registrationDate.toString().split(' ')[0]}');
//
//     int weeksSinceRegistration =
//     calculateWeeksBetweenDates(registrationDate, currentDate);
//     print('weeksSinceRegistration: $weeksSinceRegistration');
//     totalWeeks = pregnancyWeek + weeksSinceRegistration;
//     print('totalWeeks: $totalWeeks');
//
//     DateTime dateOfDelivery = DateTime(2024, 11, 11);
//     print('DateOfDelivery Date: ${dateOfDelivery.toString().split(' ')[0]}');
//     print('Child Week is: $childWeek');
//
//     isDelivered = totalWeeks > 43;
//     if (isDelivered) {
//       int weeksSinceDelivery =
//       calculateWeeksBetweenDates(dateOfDelivery, currentDate);
//       print('weeksSinceDelivery: $weeksSinceDelivery');
//       childtotalWeeks = childWeek + weeksSinceDelivery;
//       print('childtotalWeeks : ${childtotalWeeks}');
//       selectedWeek = childtotalWeeks;
//     } else {
//       selectedWeek = totalWeeks;
//     }
//
//     Map<String, int> result = getCurrentWeekNumberAndDay(currentDate);
//     int currentWeekNumber = result['weekNumber']!;
//     currentWeekDay = result['weekDay']!;
//     print('Current Week Number: $currentWeekNumber');
//     print('Current Week Day: $currentWeekDay');
//
//     Map<String, int> result1 =
//     getCurrentChildWeekNumberAndDay(dateOfDelivery, currentDate);
//     int currentchildWeekNumber = result1['weekNumber']!;
//     currentWeekDay = result1['weekDay']!;
//     print('Current Week Number: $currentchildWeekNumber');
//     print('Current Week Day: $currentWeekDay');
//   }
//
//   void generateWeekLists() {
//     pregnancyWeekList.clear();
//     childWeekList.clear();
//
//     for (int i = 0; i <= 5; i++) {
//       pregnancyWeekList.add(DeliveredWeekModel(35 + i, false));
//     }
//
//     for (int i = 1; i <= 58; i++) {
//       childWeekList.add(DeliveredWeekModel(i, true));
//     }
//   }
//
//   int calculateWeeksBetweenDates(DateTime startDate, DateTime endDate) {
//     Duration difference = endDate.difference(startDate);
//     int weeks = (difference.inDays / 7).floor();
//     return weeks;
//   }
//
//   DateTime findCurrentWeekMonday(DateTime today) {
//     int weekday = today.weekday;
//     DateTime monday = today.subtract(Duration(days: weekday - 1));
//     return monday;
//   }
//
//   Map<String, int> getCurrentWeekNumberAndDay(DateTime date) {
//     DateTime firstDayOfYear = DateTime(date.year, 1, 1);
//     int differenceInDays = date.difference(firstDayOfYear).inDays;
//     int currentWeekNumber = (differenceInDays / 7).floor() + 1;
//     int currentWeekDay = date.weekday;
//     return {'weekNumber': currentWeekNumber, 'weekDay': currentWeekDay};
//   }
//
//   Map<String, int> getCurrentChildWeekNumberAndDay(
//       DateTime dateOfDelivery, DateTime currentDate) {
//     int differenceInDays = currentDate.difference(dateOfDelivery).inDays;
//     int currentChildWeekNumber = (differenceInDays / 7).floor() + 1;
//     int currentChildWeekDay = currentDate.weekday;
//
//     return {
//       'weekNumber': currentChildWeekNumber,
//       'weekDay': currentChildWeekDay
//     };
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Horizontal Week List'),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),
//           buildHorizontalList("Combined Weeks", combinedWeekList),
//           const SizedBox(height: 20),
//           if (selectedWeek != null) buildDaysForSelectedWeek(selectedWeek!)
//         ],
//       ),
//     );
//   }
//
//   Widget buildHorizontalList(String title, List<DeliveredWeekModel> weekList) {
//     return Column(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           height: 80,
//           child: ListView.builder(
//             controller: _scrollController,
//             scrollDirection: Axis.horizontal,
//             itemCount: weekList.length,
//             itemBuilder: (context, index) {
//               final item = weekList[index];
//               bool isPregnancyWeek = !item.isDelivered;
//               bool isCurrentWeek =
//                   item.week == (isPregnancyWeek ? totalWeeks : childtotalWeeks);
//               bool isSelected = selectedWeek == item.week;
//               bool isFutureWeek =
//                   item.week > (isPregnancyWeek ? totalWeeks : childtotalWeeks);
//               bool isDisabled = isFutureWeek;
//
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: GestureDetector(
//                   onTap: isDisabled
//                       ? null
//                       : () {
//                     setState(() {
//                       selectedWeek = item.week;
//                     });
//                     print(
//                         '${isPregnancyWeek ? "Pregnancy" : "Childbirth"} Week ${item.week} clicked');
//                   },
//                   child: Container(
//                     width: 60,
//                     decoration: BoxDecoration(
//                       color: isSelected
//                           ? Colors.indigo
//                           : isCurrentWeek
//                           ? Colors.blueAccent
//                           : isDisabled
//                           ? Colors.grey[400]
//                           : Colors.grey[500],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${isPregnancyWeek ? "Preg" : "Child"}\nWeek ${item.week}',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight:
//                           isDisabled ? FontWeight.normal : FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildDaysForSelectedWeek(int selectedWeek) {
//     bool isChildbirthPhase = selectedWeek < 35 || selectedWeek > 43;
//     String phaseText = isChildbirthPhase ? "Childbirth" : "Pregnancy";
//     return Expanded(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: daysToShow.length,
//         itemBuilder: (context, index) {
//           int day = daysToShow[index];
//           bool isCurrentDay = selectedWeek == totalWeeks &&
//               day == currentWeekDay &&
//               isPast11AM();
//           bool isPastDay = selectedWeek < totalWeeks ||
//               (selectedWeek == totalWeeks && day < currentWeekDay);
//           bool isFutureDay =
//               (selectedWeek == totalWeeks || selectedWeek == childtotalWeeks) &&
//                   (day == currentWeekDay && !isPast11AM());
//           return Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: GestureDetector(
//               onTap: isFutureDay
//                   ? null
//                   : () {
//                 print('Day $day clicked in Week $selectedWeek');
//               },
//               child: Container(
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: isPastDay || isCurrentDay
//                       ? Colors.teal
//                       : isFutureDay
//                       ? Colors.grey[400]
//                       : Colors.grey[500],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '$phaseText Week $selectedWeek, Day $day',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   bool isPast11AM() {
//     TimeOfDay now = TimeOfDay.now();
//     return now.hour > 11 || (now.hour == 11 && now.minute >= 0);
//   }
// }
