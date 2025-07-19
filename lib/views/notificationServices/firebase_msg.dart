import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../home/home.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool _notificationCleared = false;

  void initLocalNotifications(context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
  }

  void firebaseInit(context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (Platform.isIOS) {
        foregroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });

    // Print the token for debugging
    printDeviceToken();
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User denied permission');
      }
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification?.android?.channelId ?? 'default_channel_id',
      message.notification?.android?.channelId ?? 'default_channel_id',
      importance: Importance.max,
      showBadge: true,
      playSound: true,
      sound: const RawResourceAndroidNotificationSound('alert'),
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      sound: channel.sound,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title ?? 'No Title',
        message.notification?.body ?? 'No Body',
        notificationDetails,
      );
    });
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      if (kDebugMode) {
        print('Token refreshed');
      }
    });
  }

  Future<void> printDeviceToken() async {
    String? token = await messaging.getToken();
    if (token != null) {
      print('Device Token: $token');
    } else {
      print('Failed to retrieve device token');
    }
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  Future<void> foregroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // Method to set the notification as cleared
  void clearNotification() {
    _notificationCleared = true;
  }

  // Method to check if the notification is cleared
  bool isNotificationCleared() {
    return _notificationCleared;
  }
}
