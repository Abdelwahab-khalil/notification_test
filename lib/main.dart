import 'package:flutter/material.dart';
import 'package:notification/pages/follow.dart';
import 'package:notification/pages/notifications.dart';
import 'package:notification/provider/may_know_provider.dart';
import 'package:notification/provider/request_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => RequestProvider()),
        ListenableProvider(create: (context) => MayKnowProvider()),
      ],
      child: MaterialApp(
        title: 'Notification Test',
        home: NotificationPage(),
      ),
    );
  }
}
