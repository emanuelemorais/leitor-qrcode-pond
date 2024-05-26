import 'package:flutter/material.dart';
import 'package:app/app/pages/login.dart';
import 'package:app/app/pages/camera.dart';
import 'package:app/app/pages/new_user.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: "basic_channel_group",
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
      )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: "basic_channel_group",
        channelGroupName: "Basic channel group",
      )
    ]
  );
  bool isNotificationAllowed = await AwesomeNotifications().isNotificationAllowed();
  if(!isNotificationAllowed){
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/camera": (context) => Camera(),
        "/new_user": (context) => NewUserPage(),
      },

    );
  }
}





