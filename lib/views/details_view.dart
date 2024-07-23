import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.notificationResponse});
  final NotificationResponse notificationResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Details'),
      ),
      body: Center(
        child: Text(
            "${notificationResponse.id} : ${notificationResponse.payload}"),
      ),
    );
  }
}
