import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:law_app/screens/image.dart';
import 'package:law_app/screens/info.dart';
import 'package:law_app/screens/lawer.dart';
import 'package:law_app/screens/countries.dart';
import 'package:law_app/screens/payment.dart';
import 'package:law_app/screens/splash.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  isFlutterLocalNotificationsInitialized = true;
}

Future<void> showFlutterNotification(String title, String body) async {
  if (!kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      Random().nextInt(1000000),
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

Future<void> requestNotificationPermission() async {
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestNotificationPermission();
  await setupFlutterNotifications();
  await initialServices();
  runApp(const MyApp());
  await showFlutterNotification(
      'تطبيق المحاميين', 'مرحبا بك في المرشد القانوني ');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      routes: {
        'Splash': (context) => const SplashScreen(),
        'Info': (context) => InfoScreen(),
        'Payment': (context) => PaymentScreen(),
        'Lawer': (context) => const LawerScreen(),
        'Images': (context) => ImageScreen(),
        'details': (context) => CoutriesScreen(),
      },
      home: SplashScreen()
    );
  }
}
