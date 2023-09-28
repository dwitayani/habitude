// import 'dart:ffi';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:habitude_aplication/screens/setting/setting_screen.dart';
// // import 'package:habitude_aplication/main.dart';
// // import 'package:habitude_aplication/screens/setting/setting_screen.dart';

// class NotificationService {
//   static Future<void> initializeNotification() async {
//     await AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//           channelGroupKey: 'basic_channel_group',
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic tests',
//           defaultColor: const Color(0xff9d50dd),
//           ledColor: Colors.white,
//           importance: NotificationImportance.Max,
//           channelShowBadge: true,
//           onlyAlertOnce: true,
//           playSound: true,
//           criticalAlerts: true,
//         )
//       ],
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupkey: 'high_importance_channel_group',
//             channelGroupName: 'Group 1')
//       ],
//       debug: true,
//     );
//     await AwesomeNotifications()
//         .isNotificationAllowed()
//         .then((isAllowed) async {
//       if (!isAllowed) {
//         await AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//     await AwesomeNotifications().setListeners(
//       onActionReceivedMethod: onActionReceivedMethod,
//       onNotificationCreatedMethod: onNotificationCreatedMethod,
//       onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//       onDismissActionReceivedMethod: onDismissActionReceivedMethod,
//     );
//   }

//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification receivedNotification) async {
//     debugPrint('onNotificationCreatedMethod');
//   }

//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {
//     debugPrint('onNotificationDisplayedMethod');
//   }

//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedNotification receivedNotification) async {
//     debugPrint('onDismissActionReceivedMethod');
//   }

//   static Future<void> onActionReceivedMethod(
//       ReceivedNotification receivedNotification) async {
//     debugPrint('onActionReceivedMethod');
//     final payload = receivedAction.payload ?? {};
//     if (payload["navigate"] == "true") {
//       MainApp.navigatorKey.currentState?.push(
//         MaterialPageRoute(builder: (_) => const SettingScreen()),
//       );
//     }
//   }

//   static Future<void> showNotification({
//     required final String tittle,
//     required final String body,
//     final String? summary,
//     final Map<String, String>? payload,
//     final ActionType actionType = ActionType.Default,
//     final NotificationLayout notificationLayout = NotificationLayout.Default,
//     final NotificationCategory? category,
//     final String? bigPicture,
//     final List<NotificationActionButton>? actionButtons,
//     final bool scheduled =  false,
//     final int? interval,
//   }) async{
//     assert(!scheduled || (scheduled && Interval != null));

//     await AwesomeNotifications().createNotification(content: NotificationContent(id: -1, channelKey: 'high_importance_channel',
//     title: title,))
//   }

  
// }
