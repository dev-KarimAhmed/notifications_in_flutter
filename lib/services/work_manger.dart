// import 'package:local_notification/services/local_notifications_service.dart';
// import 'package:workmanager/workmanager.dart';

// class WorkMangerService {

//   Future<void> registerTask() async {
//     await Workmanager().registerOneOffTask('id1', "Show simple Task");
//   }

//   Future<void> init() async {
//     await Workmanager().initialize(actionTask, isInDebugMode: true);
//     await registerTask();
//   }

//   Future<void> cancelTask(String uniqueName) async {
//     await Workmanager().cancelByUniqueName(uniqueName);
//   }
// }

//   @pragma('vm:entry-point')
//   Future<void> actionTask() async {
//     Workmanager().executeTask((task, inputData) async {
//       LocalNotificationService.showBasicNotification();
//       return true;
//     });
//   }
