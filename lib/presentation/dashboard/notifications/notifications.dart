// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteMessage message;
    // get the notification message and display on screen
    try {
      message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    } catch (e) {
      message = RemoteMessage();
    }

    return Scaffold(
      body: Scaffold(
        body: Column(
          children: [
            Text(message.notification != null
                ? message.notification!.title.toString()
                : "no notifications"),
            Text(message.notification != null
                ? message.notification!.body.toString()
                : "wsefrwqf"),
            // Text(message.data.toString()),
          ],
        ),
      ),
    );
  }
}
