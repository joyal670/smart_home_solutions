import 'package:apaniot/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gson/gson.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // functions to initilize notifications
  Future<void> initNotifications() async {
    // request permissions from the user
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for the device
    final fCMToken = await _firebaseMessaging.getToken();

    //print the token (or send it to the server)
    print('fCM Token $fCMToken');

    // initilize further settings for push notifications
    initPushNotifications();
  }

  // functions to handle received messsages
  void handleMessage(RemoteMessage? message) {
    // if message is null, do nothing
    if (message == null) return;

    // navigate to new screen when message is received and user taps notification
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  // functions to initilize foreground and background settings
  Future initPushNotifications() async {
    // handle notifications if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      print('getInitialMessage');
      handleMessage(value);
    });

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('onMessageOpenedApp');
      handleMessage(event);
    });

    // handle messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // create a local notification, instead of navigating to notification page
      // handleMessage(message);
      print('onMessage');
      showNotification(message);
    });
  }

  showNotification(RemoteMessage message) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveNotificationResponse: onSelectNotification,
      // onDidReceiveBackgroundNotificationResponse: onSelectNotification,
      onDidReceiveNotificationResponse: (details) {
        // Click Notification Event Here
        print(details.payload);
      },
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
        1,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description),
        ),
        payload: message.notification!.body.toString());
  }

  Future<void> onSelectNotification(
      NotificationResponse notificationResponse) async {
    if (notificationResponse != null) {
      print('Notification clicked with payload: $notificationResponse');
    }

    // Add your logic here to navigate or perform actions based on the notification payload
  }
}
