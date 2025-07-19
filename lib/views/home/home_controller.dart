import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_services/GraphQLService.dart';
import '../../api_services/registartion_api.dart';
import '../../model/registration_model.dart';
import '../../utils/week_content_list.dart';
import '../notificationServices/notification.dart';

class HomeController extends GetxController {
  var selectedWeek = 0.obs;
  var hasReceivedNotificationForToday = false.obs;
  var pregWeekNotifier = ValueNotifier<bool>(false);
  var childWeekNotifier = ValueNotifier<bool>(false);
  var selectedPregnancyWeekNumber = 0.obs;
  var selectedChildWeekNumber = 0.obs;
  var pregnancyWeek = 0.obs;
  var isPregnancyWeekSelected = false.obs;
  var isChildWeekSelected = false.obs;
  var isDelivered = false.obs;
  var isLoading = true.obs;
  var currentWeek = 0.obs;
  var registrationWeekIndex = 0.obs;
  int pregnancyIdBase = 1000;
  int childIdBase = 2000;
  final List<int> daysToShow = [1, 3, 5];
  late DateTime registrationDate;
  late DateTime deliveryDate;
  late NotificationService _notificationService;
  late RegistrationAPI apiServices;
  RegistrationModel? registrationModel;
  var _justShownCustomDialog = false;

  @override
  void onInit() {
    super.onInit();
    print('🚀 HomeController: onInit started');
    final client = GraphQLConfig.clientNotifier.value;
    apiServices = RegistrationAPI(client);
    registrationDate = DateTime.now();
    deliveryDate = DateTime.now();
    _notificationService = NotificationService();
    print(
        '📡 Initialized: GraphQL client, RegistrationAPI, NotificationService');
    loadInitialData();
    pregWeekNotifier.addListener(() {
      print('🔔 pregWeekNotifier triggered');
      update();
    });
    print('✅ HomeController: onInit completed');
  }

  Future<void> loadInitialData() async {
    print('📥 loadInitialData: Started');
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pregnancyWeek.value = prefs.getInt('pregnancyWeek') ?? 0;
    selectedPregnancyWeekNumber.value =
        prefs.getInt('selectedPregnancyWeekNumber') ?? 0;
    selectedChildWeekNumber.value =
        prefs.getInt('selectedChildWeekNumber') ?? 0;
    isChildWeekSelected.value = prefs.getBool('isChildWeekSelected') ?? false;
    isPregnancyWeekSelected.value =
        prefs.getBool('isPregnancyWeekSelected') ?? false;
    isDelivered.value = prefs.getBool('isDelivered') ?? false;
    int? registrationDateEpoch = prefs.getInt('registrationDateEpoch');
    if (registrationDateEpoch != null) {
      registrationDate =
          DateTime.fromMillisecondsSinceEpoch(registrationDateEpoch);
    }
    int? deliveryDateEpoch = prefs.getInt('deliveryDateEpoch');
    if (deliveryDateEpoch != null) {
      deliveryDate = DateTime.fromMillisecondsSinceEpoch(deliveryDateEpoch);
    }

    print('📋 SharedPreferences Loaded:');
    print('  pregnancyWeek: ${pregnancyWeek.value}');
    print('  registrationWeekIndex: ${pregnancyWeek.value - 35}');
    print('  isDelivered: ${isDelivered.value}');
    print('  registrationDate: ${registrationDate.toLocal()}');
    print('  deliveryDate: ${deliveryDate.toLocal()}');
    print('  hasShownPostLoginDialog: ${await _hasShownPostLoginDialog()}');
    print('  hasVisitedWeek35: ${await _hasVisitedWeek35()}');
    print('  hasVisitedWeek3: ${await _hasVisitedWeek3()}');
    print(
        '  hasShownCongratulationDialog: ${await _hasShownCongratulationDialog()}');

    await fetchUserFromAPI();

    if (pregnancyWeek.value != 0) {
      print('🧮 Computing weeks...');
      computeWeeks();
    } else {
      print(
          '⚠️ Pregnancy week is still 0 after loading from SharedPreferences');
    }

    print('🔍 After computeWeeks:');
    print('  currentWeek: ${currentWeek.value}');
    print('  registrationWeekIndex: ${registrationWeekIndex.value}');
    print('  selectedWeek: ${selectedWeek.value}');

    if (currentWeek.value < weeksContent.length) {
      bool hasVisitedWeek35 = await _hasVisitedWeek35();
      bool hasShownCongratulationDialog = await _hasShownCongratulationDialog();

      // Set the selected week based on delivery status
      if (isDelivered.value) {
        selectedWeek.value = currentWeek.value;
        print('🚚 Delivered ${currentWeek.value}');
        updateWeekSelectionLogic(currentWeek.value);
      } else {
        selectedWeek.value = registrationWeekIndex.value;
        print(
            '🤰 Not Delivered: Setting selectedWeek to registrationWeekIndex: ${registrationWeekIndex.value}');
        updateWeekSelectionLogic(registrationWeekIndex.value);
      }

      // Show custom dialog only for pregnancy weeks 36 or 37, explicitly exclude week 35
      if ((registrationWeekIndex.value == 1 ||
              registrationWeekIndex.value == 2) &&
          registrationWeekIndex.value != 0 &&
          !hasVisitedWeek35 &&
          !_justShownCustomDialog) {
        print(
            '📢 Showing custom dialog for pregnancy week: ${35 + registrationWeekIndex.value}');
        _justShownCustomDialog = true;
        showCustomDialog(selectedWeek.value, (newWeek) {
          print(
              '📲 Dialog callback: Navigating to week 35 (newWeek: $newWeek)');
          selectedWeek.value = 0; // Navigate to week 35
          _saveSelectedWeek();
          _justShownCustomDialog = false;
          _setWeek35Visited();
        });
      } else if (isDelivered.value &&
          selectedChildWeekNumber.value == 1 &&
          !hasShownCongratulationDialog) {
        print('🎉 Triggering congratulation dialog for 1st child week');
        _showCongratulationDialog((week) {
          print('🎉 Congratulation dialog callback: Continuing to week: $week');
          _setCongratulationDialogShown();
          selectedWeek.value = currentWeek.value;
          _saveSelectedWeek();
          update();
          _notificationService.handleWeekTransition(
            isDelivered.value,
            selectedPregnancyWeekNumber.value,
            selectedChildWeekNumber.value,
          );
        });
      } else {
        print('🔄 Proceeding with week selection: ${selectedWeek.value}');
        _proceedWithWeekSelection(selectedWeek.value);
      }
    } else {
      print('⚠️ Current week exceeds content length: ${currentWeek.value}');
    }

    if (!hasReceivedNotificationForToday.value) {
      print('🔔 Sending notification for today');
      await _notificationService.handleWeekTransition(
        isDelivered.value,
        selectedPregnancyWeekNumber.value,
        selectedChildWeekNumber.value,
      );
      hasReceivedNotificationForToday.value = true;
    }

    isLoading.value = false;
    print('✅ loadInitialData: Completed');
  }

  Future<void> fetchUserFromAPI() async {
    print('🌐 fetchUserFromAPI: Started');
    registrationModel = await apiServices.fetchUserData();
    if (registrationModel != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      pregnancyWeek.value = registrationModel!.weekBefore;
      isDelivered.value = registrationModel!.isDelivered;
      registrationDate = registrationModel!.createdAt;

      if (isDelivered.value) {
        deliveryDate = registrationModel!.deliveryDate ?? registrationDate;
        print(
            '🚚 Delivery status: Delivered, setting deliveryDate: ${deliveryDate.toLocal()}');
      } else {
        deliveryDate = registrationDate
            .add(Duration(days: (40 - pregnancyWeek.value) * 7));
        print(
            '🤰 Delivery status: Not delivered, calculated deliveryDate: ${deliveryDate.toLocal()}');
      }

      await prefs.setInt('pregnancyWeek', pregnancyWeek.value);
      await prefs.setBool('isDelivered', isDelivered.value);
      await prefs.setInt(
          'registrationDateEpoch', registrationDate.millisecondsSinceEpoch);
      await prefs.setInt(
          'deliveryDateEpoch', deliveryDate.millisecondsSinceEpoch);
      print('✅ API User: ${registrationModel!.fullName}');
      print('📆 Registered On: ${registrationDate.toLocal()}');
      print('👶 Pregnancy Week At Registration: $pregnancyWeek');
      print('🚚 Delivered? ${isDelivered.value ? "Yes" : "No"}');
      print('📅 Delivery Date: ${deliveryDate.toLocal()}');
      print(
          '🔔 API Delivery Date: ${registrationModel!.deliveryDate?.toLocal() ?? "null"}');
    } else {
      print('❌ fetchUserFromAPI: Failed to load user data');
    }
    print('🌐 fetchUserFromAPI: Completed');
  }

  void computeWeeks() {
    print('🧮 computeWeeks: Started');
    DateTime today = DateTime.now();
    registrationWeekIndex.value = pregnancyWeek.value - 35;

    if (!isDelivered.value) {
      int daysSinceRegistration = today.difference(registrationDate).inDays;
      currentWeek.value =
          registrationWeekIndex.value + (daysSinceRegistration ~/ 7);
      if (currentWeek.value < registrationWeekIndex.value) {
        currentWeek.value = registrationWeekIndex.value;
        print(
            '⚠️ Adjusted currentWeek to registrationWeekIndex: ${currentWeek.value}');
      }
    } else {
      int daysSinceDelivery = today.difference(deliveryDate).inDays;
      int weeksSinceDelivery = daysSinceDelivery ~/ 7;
      currentWeek.value = 2 + weeksSinceDelivery;
      if (currentWeek.value < 3) {
        currentWeek.value = 3;
        print(
            '⚠️ Adjusted currentWeek to minimum child week: ${currentWeek.value}');
      }
      selectedChildWeekNumber.value = weeksSinceDelivery + 1;
    }

    if (currentWeek.value >= weeksContent.length) {
      currentWeek.value = weeksContent.length - 1;
      print(
          '⚠️ Capped currentWeek to max content length: ${currentWeek.value}');
    }

    print('🗓️ Registration Date: ${registrationDate.toLocal()}');
    print('📅 Today: ${today.toLocal()}');
    print('🔢 Current Week: ${currentWeek.value}');
    print('🏷️ Registration Week Index: ${registrationWeekIndex.value}');
    print('📅 Delivery Date: ${deliveryDate.toLocal()}');
    print('👶 Child Week Number: ${selectedChildWeekNumber.value}');
    print('🧮 computeWeeks: Completed');
  }

  List<int> getSelectableWeeks() {
    print('📋 getSelectableWeeks: Started');
    List<int> selectableWeeks;
    if (isDelivered.value) {
      selectableWeeks = List.generate(
          (currentWeek.value + 1).clamp(0, weeksContent.length),
          (index) => index);
      print('🚚 Delivered: Selectable weeks: $selectableWeeks');
    } else {
      selectableWeeks = List.generate(
          (registrationWeekIndex.value + 1).clamp(0, 3), (index) => index);
      print('🤰 Not Delivered: Selectable weeks: $selectableWeeks');
    }
    print('📋 getSelectableWeeks: Completed');
    return selectableWeeks;
  }

  void updateWeekSelectionLogic(int weekIndex) {
    print('🔄 updateWeekSelectionLogic: Started with weekIndex: $weekIndex');
    if (weekIndex < 3) {
      isPregnancyWeekSelected.value = true;
      isChildWeekSelected.value = false;
      selectedPregnancyWeekNumber.value = 35 + weekIndex;
      selectedChildWeekNumber.value = 0;
      print('🤰 Selected Pregnancy Week: ${selectedPregnancyWeekNumber.value}');
    } else {
      isChildWeekSelected.value = true;
      isPregnancyWeekSelected.value = false;
      selectedChildWeekNumber.value = weekIndex - 2;
      selectedPregnancyWeekNumber.value = 0;
      print('👶 Selected Child Week: ${selectedChildWeekNumber.value}');
    }
    print('🔄 updateWeekSelectionLogic: Completed');
  }

  Future<void> _saveSelectedWeek() async {
    print('💾 _saveSelectedWeek: Started');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
        'selectedPregnancyWeekNumber', selectedPregnancyWeekNumber.value);
    await prefs.setInt(
        'selectedChildWeekNumber', selectedChildWeekNumber.value);
    await prefs.setBool(
        'isPregnancyWeekSelected', isPregnancyWeekSelected.value);
    await prefs.setBool('isChildWeekSelected', isChildWeekSelected.value);
    await prefs.setBool('isDelivered', isDelivered.value);
    await prefs.setInt('pregnancyWeek', pregnancyWeek.value);
    await prefs.setInt(
        'currentEpochDate', DateTime.now().millisecondsSinceEpoch);
    await prefs.setInt(
        'registrationDateEpoch', registrationDate.millisecondsSinceEpoch);
    await prefs.setInt(
        'deliveryDateEpoch', deliveryDate.millisecondsSinceEpoch);
    if (selectedWeek.value == 0) {
      await prefs.setBool('hasVisitedWeek35', true);
      print('📌 Marked week 35 as visited');
    }
    print(
        '💾 Saved: pregnancyWeek=${pregnancyWeek.value}, selectedWeek=${selectedWeek.value}');
    print('💾 _saveSelectedWeek: Completed');
  }

  Future<bool> _hasShownCongratulationDialog() async {
    print('🔍 _hasShownCongratulationDialog: Checking');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool('hasShownCongratulationDialog') ?? false;
    print('🔍 _hasShownCongratulationDialog: Result: $result');
    return result;
  }

  Future<void> _setCongratulationDialogShown() async {
    print('📌 _setCongratulationDialogShown: Setting flag');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasShownCongratulationDialog', true);
    print('📌 _setCongratulationDialogShown: Completed');
  }

  Future<bool> _hasShownPostLoginDialog() async {
    print('🔍 _hasShownPostLoginDialog: Checking');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool('hasShownPostLoginDialog') ?? false;
    print('🔍 _hasShownPostLoginDialog: Result: $result');
    return result;
  }

  Future<bool> _hasVisitedWeek35() async {
    print('🔍 _hasVisitedWeek35: Checking');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool visited = prefs.getBool('hasVisitedWeek35') ?? false;
    print('🔍 _hasVisitedWeek35: Result: $visited');
    return visited;
  }

  Future<void> _setWeek35Visited() async {
    print('📌 _setWeek35Visited: Setting flag');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasVisitedWeek35', true);
    print('📌 _setWeek35Visited: Completed');
  }

  Future<bool> _hasVisitedWeek3() async {
    print('🔍 _hasVisitedWeek3: Checking');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool('hasVisitedWeek3') ?? false;
    print('🔍 _hasVisitedWeek3: Result: $result');
    return result;
  }

  Future<void> resetPostLoginDialog() async {
    print('🔄 resetPostLoginDialog: Started');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasShownPostLoginDialog', false);
    print('🔄 resetPostLoginDialog: Completed');
  }

  Future<void> resetWeek35Visit() async {
    print('🔄 resetWeek35Visit: Started');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasVisitedWeek35', false);
    print('🔄 resetWeek35Visit: Completed');
  }

  Future<void> resetWeek3Visit() async {
    print('🔄 resetWeek3Visit: Started');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasVisitedWeek3', false);
    print('🔄 resetWeek3Visit: Completed');
  }

  Future<void> resetCongratulationDialog() async {
    print('🔄 resetCongratulationDialog: Started');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasShownCongratulationDialog', false);
    print('🔄 resetCongratulationDialog: Completed');
  }

  bool isWeekSelectable(int weekIndex) {
    print('🔎 isWeekSelectable: Checking weekIndex: $weekIndex');
    bool selectable;
    if (!isDelivered.value) {
      selectable = weekIndex <= registrationWeekIndex.value;
      print(
          '🤰 Not Delivered: weekIndex $weekIndex is ${selectable ? "selectable" : "not selectable"} (registrationWeekIndex: ${registrationWeekIndex.value})');
    } else {
      selectable = weekIndex <= currentWeek.value;
      print(
          '🚚 Delivered: weekIndex $weekIndex is ${selectable ? "selectable" : "not selectable"} (currentWeek: ${currentWeek.value})');
    }
    return selectable;
  }

  void updateSelectedWeek(int weekIndex) async {
    print('🔍 updateSelectedWeek: Attempting to select week: $weekIndex');
    if (isWeekSelectable(weekIndex)) {
      print('✅ Week $weekIndex is selectable');
      _justShownCustomDialog = false;
      await _proceedWithWeekSelection(weekIndex);
    } else {
      print(
          '🚫 Week $weekIndex not selectable (currentWeek: ${currentWeek.value})');
    }
  }

  void _showCongratulationDialog(Function(int) onContinue) {
    print('🎉 _showCongratulationDialog: Showing dialog');
    Get.dialog(
      _FadeDialog(
        onContinue: onContinue,
      ),
      barrierDismissible: false,
      barrierColor: Colors.black54,
    );
    print('🎉 _showCongratulationDialog: Dialog displayed');
  }

  Future<void> _proceedWithWeekSelection(int weekIndex) async {
    print('🔄 _proceedWithWeekSelection: Started with weekIndex: $weekIndex');
    updateWeekSelectionLogic(weekIndex);
    selectedWeek.value = weekIndex;
    print('⭐ Set selectedWeek to: $weekIndex');
    await _saveSelectedWeek();
    update();

    bool hasShownCongratulationDialog = await _hasShownCongratulationDialog();

    if (isDelivered.value && selectedChildWeekNumber.value == 1) {
      if (!hasShownCongratulationDialog) {
        print('🎉 Triggering congratulation dialog for child week 1');
        _showCongratulationDialog((week) {
          print('🎉 Congratulation dialog callback: Continuing to week: $week');
          _setCongratulationDialogShown();
          selectedWeek.value = weekIndex;
          _saveSelectedWeek();
          update();
          _notificationService.handleWeekTransition(
            isDelivered.value,
            selectedPregnancyWeekNumber.value,
            selectedChildWeekNumber.value,
          );
        });
        return;
      }
    }

    print('🔔 Triggering notification for week transition');
    _notificationService.handleWeekTransition(
      isDelivered.value,
      selectedPregnancyWeekNumber.value,
      selectedChildWeekNumber.value,
    );
    print('⭐ Selected Week: $weekIndex');
    print('📆 Current Week: ${currentWeek.value}');
    print('🔄 _proceedWithWeekSelection: Completed');
  }

  List<Color> get gradientColors {
    print('🎨 get gradientColors: Started');
    List<Color> colors;
    if (isPregnancyWeekSelected.value) {
      if (selectedPregnancyWeekNumber.value == 35 ||
          selectedPregnancyWeekNumber.value == 36) {
        colors = [const Color(0xFFD8E8F7), const Color(0xFF2391C9)];
        print('🎨 Pregnancy Week 35/36: Colors set to blue gradient');
      } else if (selectedPregnancyWeekNumber.value == 37) {
        colors = [const Color(0xFFEFD8F7), const Color(0xFFCA52CC)];
        print('🎨 Pregnancy Week 37: Colors set to purple gradient');
      } else {
        colors = [const Color(0xFFD8E8F7), const Color(0xFF2391C9)];
        print('🎨 Default Pregnancy: Colors set to blue gradient');
      }
    } else {
      if (selectedChildWeekNumber.value >= 25 &&
          selectedChildWeekNumber.value <= 48) {
        colors = [const Color(0xFFD8F7DA), const Color(0xFF4EA51B)];
        print('🎨 Child Week 25-48: Colors set to green gradient');
      } else {
        colors = [const Color(0xFFF7DAD8), const Color(0xFFC95F23)];
        print('🎨 Default Child Week: Colors set to orange gradient');
      }
    }
    print('🎨 get gradientColors: Completed with colors: $colors');
    return colors;
  }

  String get imagePath {
    print('🖼️ get imagePath: Started');
    String path;
    if (isPregnancyWeekSelected.value) {
      if (selectedPregnancyWeekNumber.value == 37) {
        path = 'assets/images/delivery_37.png';
        print('🖼️ Pregnancy Week 37: Image set to delivery_37.png');
      } else {
        path = 'assets/images/Group-2614.png';
        print('🖼️ Default Pregnancy: Image set to Group-2614.png');
      }
    } else {
      if (selectedChildWeekNumber.value >= 25 &&
          selectedChildWeekNumber.value <= 48) {
        path = 'assets/images/complimentary_feeding.png';
        print('🖼️ Child Week 25-48: Image set to complimentary_feeding.png');
      } else {
        path = 'assets/images/child_week.png';
        print('🖼️ Default Child Week: Image set to child_week.png');
      }
    }
    print('🖼️ get imagePath: Completed with path: $path');
    return path;
  }

  Object getWeekContent() {
    print(
        '📖 getWeekContent: Started with selectedWeek: ${selectedWeek.value}');
    if (selectedWeek.value >= 0 && selectedWeek.value < weeksContent.length) {
      print('📖 Returning content for week: ${selectedWeek.value}');
      return weeksContent[selectedWeek.value];
    }
    print('⚠️ No content available for week: ${selectedWeek.value}');
    return "کوئی مواد دستیاب نہیں";
  }

  @override
  void onClose() {
    print('🛑 HomeController: onClose started');
    pregWeekNotifier.dispose();
    childWeekNotifier.dispose();
    print('🗑️ Disposed: pregWeekNotifier, childWeekNotifier');
    super.onClose();
    print('🛑 HomeController: onClose completed');
  }
}

class _FadeDialog extends StatefulWidget {
  final Function(int) onContinue;

  const _FadeDialog({required this.onContinue});

  @override
  _FadeDialogState createState() => _FadeDialogState();
}

class _FadeDialogState extends State<_FadeDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    print('🎬 _FadeDialogState: initState started');
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
    print('🎬 _FadeDialogState: Animation started');
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && Get.isDialogOpen == true) {
        print('🎬 _FadeDialogState: Reversing animation and closing dialog');
        _controller.reverse().then((_) {
          Get.back();
          widget.onContinue(1);
          print(
              '🎬 _FadeDialogState: Dialog closed, callback triggered with week 1');
        });
      }
    });
  }

  @override
  void dispose() {
    print('🗑️ _FadeDialogState: dispose started');
    _controller.dispose();
    print('🗑️ _FadeDialogState: AnimationController disposed');
    super.dispose();
    print('🗑️ _FadeDialogState: dispose completed');
  }

  @override
  Widget build(BuildContext context) {
    print('🛠️ _FadeDialogState: Building dialog');
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/animation/cong.json',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              const Text(
                'واہ! آپ نے 37 ہفتوں کا سفر مکمل کر لیا! 🎉',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontFamily: 'AlQalamTajNastaleeqRegular',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                '🎊 ننھے مہمان کی آمد پر آپ کو دلی مبارکباد!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontFamily: 'AlQalamTajNastaleeqRegular',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCustomDialog(int currentWeekIndex, Function(int) onContinue,
    {bool isNewRegistration = false}) {
  print(
      '📢 showCustomDialog: Started with currentWeekIndex: $currentWeekIndex, isNewRegistration: $isNewRegistration');
  if (!Get.isDialogOpen!) {
    print('📢 showCustomDialog: Displaying dialog');
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: 30.h,
          ),
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
                      '!رکئیے',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'AlQalamTajNastaleeqRegular',
                        color: Colors.black87,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'آج کا پیغام پڑھنے سے پہلے پچھلے پیغامات کو پڑھیں تاکہ\n بچے اور آپ کی صحت سے متعلق ضروری معلومات تک\n آپ کی مکمل رسائی ممکن ہو سکے۔',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'AlQalamTajNastaleeqRegular',
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'آپ کے تعاون اور وقت کا بے حد شکریہ۔',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'AlQalamTajNastaleeqRegular',
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print(
                                '📢 showCustomDialog: Button pressed, closing dialog');
                            Get.back();
                            final controller = Get.find<HomeController>();
                            controller.updateSelectedWeek(0);
                            onContinue(0);
                            print('📢 showCustomDialog');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0281C1),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'پچھلے پیغامات',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'AlQalamTajNastaleeqRegular',
                            ),
                          ),
                        ),
                      ),
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
    print('📢 showCustomDialog: Dialog displayed');
  } else {
    print('📢 showCustomDialog: Dialog already open, skipping');
  }
}
