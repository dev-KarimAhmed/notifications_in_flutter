import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {
    // log(notificationResponse.id!.toString());
    // log(notificationResponse.payload!.toString());
    // Navigator.push(context, route);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic Notification
  static void showBasicNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      'id 0',
      'basic notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Baisc Notification',
      'body',
      details,
      payload: "Payload Data",
    );
  }

  //repeated Notification
  static void showRepeatedNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      'id 1',
      'Repeated notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Repeated Notification',
      'body',
      RepeatInterval.everyMinute,
      details,
      payload: "Payload Data",
    );
  }

  //Scheduled Notification
  static void showScheduledNotification() async {
    tz.initializeTimeZones();
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      'id 2',
      'Scheduled notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    log(tz.local.name);
    log(tz.TZDateTime.now(tz.local).hour.toString());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Scheduled Notification',
      'body',
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      tz.TZDateTime(
        tz.local,
        2024,
        7,
        23,
        7,
        56,
      ),
      details,
      payload: "Payload Data",
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
