import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pehli_gaza_app/views/bottomNavBar/bottomnavbar.dart';
import 'package:pehli_gaza_app/views/login/provider/login_provider.dart';
import 'package:pehli_gaza_app/views/notificationServices/firebase_msg.dart';
import 'package:pehli_gaza_app/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'api_services/GraphQLService.dart';
import 'config/route_imports.dart';

void callbackDispatcher() {
  // Register plugins in background isolate
  WidgetsFlutterBinding.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Start Workmanager task execution
  Workmanager().executeTask((task, inputData) async {
    try {
      switch (task) {
        case 'pregnancy_notification_task':
          int totalPregnancyWeek = inputData?['totalPregnancyWeek'] ?? 0;
          int currentWeekDay = inputData?['currentWeekDay'] ?? 0;

          print(
              'Executing pregnancy notification task: Week $totalPregnancyWeek, Day $currentWeekDay');

          // Optionally, show a notification
          await flutterLocalNotificationsPlugin.show(
            0,
            'Pregnancy Notification',
            'Week $totalPregnancyWeek, Day $currentWeekDay',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'pregnancy_channel',
                'Pregnancy Notifications',
                channelDescription:
                    'Notifications related to pregnancy updates',
                importance: Importance.high,
                priority: Priority.high,
              ),
            ),
          );
          break;

        case 'child_notification_task':
          int totalChildWeek = inputData?['totalChildWeek'] ?? 0;
          int currentWeekDay = inputData?['currentWeekDay'] ?? 0;

          print(
              'Executing child notification task: Week $totalChildWeek, Day $currentWeekDay');

          // Optionally, show a notification
          await flutterLocalNotificationsPlugin.show(
            1,
            'Child Notification',
            'Week $totalChildWeek, Day $currentWeekDay',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'child_channel',
                'Child Notifications',
                channelDescription: 'Notifications related to child updates',
                importance: Importance.high,
                priority: Priority.high,
              ),
            ),
          );
          break;

        default:
          print('Unknown task: $task');
          break;
      }
    } catch (e) {
      print('Error executing task: $e');
    }

    // Return true when the task is complete
    return Future.value(true);
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  // This must be called only once
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  NotificationServices().printDeviceToken();
  // await FirebaseApi().initNotifications();

  // Initialize Workmanager
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  // Initialize other resources
  await initHiveForFlutter();
  await loadAuthToken();
  final autoLoggedIn = await autoLogin();

  runApp(GraphQLProvider(
    client: GraphQLConfig.clientNotifier,
    child: MyApp(autoLoggedIn: autoLoggedIn),
  ));
}

class MyApp extends StatelessWidget {
  final bool autoLoggedIn;

  const MyApp({Key? key, required this.autoLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: AppRoutes.routes,
            home: autoLoggedIn ? BottomNavBar() : SplashScreen(),
          );
        },
      ),
    );
  }
}

Future<void> loadAuthToken() async {
  final prefs = await SharedPreferences.getInstance();
  final authToken = prefs.getString('authToken');

  if (authToken != null) {
    GraphQLConfig.updateAuthToken(authToken);
  }
}

Future<bool> autoLogin() async {
  final prefs = await SharedPreferences.getInstance(); // Singleton
  final authToken = prefs.getString('authToken');

  if (authToken != null) {
    GraphQLConfig.updateAuthToken(authToken);
    return true;
  }
  return false;
}
