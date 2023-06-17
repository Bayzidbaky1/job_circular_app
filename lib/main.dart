import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_circular_bd/pages/home.dart';

import 'app_style/app_color.dart';
import 'pages/notification/my_notification.dart';
import 'pages/notification/notification_api.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("----check Mesage${message.data}");
  // FlutterAppBadger.updateBadgeCount(1);
  print('A bg message just showed up :  ${message.messageId},${message.data}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var tok = await FirebaseMessaging.instance.getToken();
  print("token___$tok");
  await FirebaseMessaging.instance.subscribeToTopic('TopicToListen');

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyNotification myNotification = MyNotification();
  @override
  void initState() {
    NotificationApi.init();
    myNotification.remoteMessage();
    myNotification.onMessageOpenApp(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BD Jobs Circular',
      theme: ThemeData(
        textTheme: GoogleFonts.outfitTextTheme(),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.bg_color,
      ),
      home: HomePage(),
    );
  }
}
