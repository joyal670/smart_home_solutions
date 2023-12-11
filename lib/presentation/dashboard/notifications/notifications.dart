// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  List<Notification> notification = [];

  @override
  Widget build(BuildContext context) {
    // RemoteMessage message;
    // // get the notification message and display on screen
    // try {
    //   message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    // } catch (e) {
    //   message = RemoteMessage();
    // }

    notification.clear();
    notification.add(Notification(
        title: 'You have been assigned a new conversation',
        description: 'Conversation assigned',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'Hello',
        description: 'app-relese-neeto: Visitor sent a message',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'A new ticket has been opened by Visitor',
        description: 'app-relese-neeto: Visitor opened new ticket',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'You have been assigned a new conversation',
        description: 'aConversation assigned',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'Hello',
        description: 'app-relese-neeto: Visitor sent a message',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'A new ticket has been opned by Visitor',
        description: 'app-relese-neeto: Visitor opened new ticket',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'You have been assigned a new conversation',
        description: 'Conversation assigned',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'Hello',
        description: 'app-relese-neeto: Visitor sent a message',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'A new ticket has been opned by Visitor',
        description: 'app-relese-neeto: Visitor opened new ticket',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'You have been assigned a new conversation',
        description: 'aConversation assigned',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'Hello',
        description: 'app-relese-neeto: Visitor sent a message',
        days: '5 days ago'));
    notification.add(Notification(
        title: 'A new ticket has been opned by Visitor',
        description: 'app-relese-neeto: Visitor opened new ticket',
        days: '5 days ago'));

    return Scaffold(
      body: Scaffold(
        // body: Column(
        //   children: [
        //     Text(message.notification != null
        //         ? message.notification!.title.toString()
        //         : "no notifications"),
        //     Text(message.notification != null
        //         ? message.notification!.body.toString()
        //         : "wsefrwqf"),
        //     // Text(message.data.toString()),
        //   ],
        // ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: ListView.separated(
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: colorBlue.withOpacity(.05),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          title: notification[index].title,
                          textStyle: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      height3,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification[index].description,
                              style: TextStyle(
                                color: colorGrey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          TextWidget(
                              title: notification[index].days,
                              textStyle: TextStyle(
                                  color: colorGrey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14)),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext ctx, index) => height10,
              itemCount: notification.length),
        ),
      ),
    );
  }
}

class Notification {
  final String title;
  final String description;
  final String days;

  Notification(
      {required this.title, required this.description, required this.days});
}
