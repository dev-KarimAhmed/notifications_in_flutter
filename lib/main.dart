import 'package:flutter/material.dart';

import 'services/local_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notification Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        // useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            },
            leading: const Icon(Icons.notifications),
            title: const Text('Schduled Notification'),
            trailing: IconButton(
              onPressed: () {
                // LocalNotificationService.cancelNotification(2);
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
}
