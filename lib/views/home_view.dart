import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_notification/services/local_notifications_service.dart';
import 'package:local_notification/views/details_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    log("message");
    listenToNotification();
    super.initState();
  }

  void listenToNotification() {
    LocalNotificationService.streamController.stream
        .listen((notificationResponse) {
      log(notificationResponse.id!.toString());
      log(notificationResponse.payload!.toString());
      //Can insert logic to get data from database by id
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  DetailsView(notificationResponse: notificationResponse)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: const Icon(Icons.notifications),
        titleSpacing: 0.0,
        title: const Text('Flutter Local Notification Tutorial'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //basic
          ListTile(
            onTap: () {
              LocalNotificationService.showBasicNotification();
            },
            leading: const Icon(Icons.notifications),
            title: const Text('Basic Notification'),
            trailing: IconButton(
              onPressed: () {
                LocalNotificationService.cancelNotification(0);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
          //repeated
          ListTile(
            onTap: () {
              LocalNotificationService.showRepeatedNotification();
            },
            leading: const Icon(Icons.notifications),
            title: const Text('Repeated Notification'),
            trailing: IconButton(
              onPressed: () {
                LocalNotificationService.cancelNotification(1);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
          //Schduled
          ListTile(
            onTap: () {
              LocalNotificationService.showScheduledNotification();
            },
            leading: const Icon(Icons.notifications),
            title: const Text('Schduled Notification'),
            trailing: IconButton(
              onPressed: () {
                LocalNotificationService.cancelNotification(2);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
          //cancel All
          ElevatedButton(
            onPressed: () {
              LocalNotificationService.flutterLocalNotificationsPlugin
                  .cancelAll();
            },
            child: const Text('Cancel All'),
          )
        ],
      )),
    );
  }

  @override
  void dispose() {
    LocalNotificationService.streamController.close();
    super.dispose();
  }
}
