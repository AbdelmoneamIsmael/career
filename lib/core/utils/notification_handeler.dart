import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class NotificationHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<String> init() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await Permission.notification.request();

    await initializeLocalNotificationPlugn();

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage noti) {
      RemoteNotification? notification = noti.notification;
      AndroidNotification? android = noti.notification?.android;

      if (notification != null && android != null) {
        log("notification happppen");
        showNotification(
            id: noti.hashCode,
            title: notification.title,
            body: notification.body);
      }
    });

    if (Platform.isAndroid) {
      return await FirebaseMessaging.instance.getToken() ?? "";
    } else if (Platform.isIOS || Platform.isMacOS) {
      var token = await FirebaseMessaging.instance.getAPNSToken();
      // token = await FirebaseMessaging.instance.getToken(); 
      return token ?? "";
    } else {
      return "";
    }
  }

  static void showNotification(
      {required int id, String? title, String? body, String? payload}) {
    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails(),
        payload: payload);
  }

  static NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static initializeLocalNotificationPlugn() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }
/*
android 
1)
  <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
   <uses-permission android:name="android.permission.VIBRATE" />
   <uses-permission android:name="android.permission.USE_FULL_SCREEN_INTENT" />
   <uses-permission android:name="android.permission.USE_EXACT_ALARM" />
   <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
   <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
   <uses-permission android:name="android.permission.FOREGROUND_SERVICE_SPECIAL_USE" />

****   after <manifest xmlns:android="http://schemas.android.com/apk/res/android">***
2)
======after  <meta-data
            android:name="flutterEmbedding"
            android:value="2" /> ============================


            <service
            android:name="com.dexterous.flutterlocalnotifications.ForegroundService"        
            android:exported="false"
            android:stopWithTask="false"
            android:foregroundServiceType="specialUse">
            <property android:name="android.app.PROPERTY_SPECIAL_USE_FGS_SUBTYPE" android:value="To demonstrate how to use foreground services to show notifications"/>
        </service>
        <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver" />
        <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
        <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED"/>
                <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
                <action android:name="android.intent.action.QUICKBOOT_POWERON" />
                <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
            </intent-filter>
        </receiver>

        ===========  after </application>===============

3)
     <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />


 for ios implementation

 in ios/Runner/AppDelegate.swift

 import flutter_local_notifications
import FirebaseCore
 after bool 

      FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
        GeneratedPluginRegistrant.register(with: registry)
    }

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    }

    ====in build gradel ====
    inside android add this line in compileOptions

        compileOptions {
         coreLibraryDesugaringEnabled true
         ...

and add inside defaultConfig 
            ...
           multiDexEnabled true
           ...
           
    and add dependancies at the end of application
    dependencies {
  coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:1.2.2'
}

*/
}
