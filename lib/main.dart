import 'package:apaniot/firebase/firebaseapi.dart';
import 'package:apaniot/firebase_options.dart';
import 'package:apaniot/presentation/dashboard.dart';
import 'package:apaniot/presentation/dashboard/notifications/notifications.dart';
import 'package:apaniot/presentation/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      routes: {'/notification_screen': (context) => NotificationsScreen()},
      home: WelcomeScreen(),
    );
  }
}
