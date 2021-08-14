import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> initialNotification() async {
   flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid, iOS: null);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(String id, String name, String address) async {
  var android = new AndroidNotificationDetails(id, name, address,
      priority: Priority.high, importance: Importance.max);
  var platform = new NotificationDetails(
    android: android,
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    name,
    address,
    platform,
  );
}
