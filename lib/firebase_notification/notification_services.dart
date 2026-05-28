

import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp/firebase_notification/message_screen.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initLocalNotifications(BuildContext context , RemoteMessage message)async{
    var androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher'); // FOR ANDROID
    var iosInitializationSettings = DarwinInitializationSettings(); // FOR IOS
    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(
        settings: initializationSetting ,
      onDidReceiveNotificationResponse: (payload){
          handleMessage(context, message);
      }
    );
  }

  void requestNotificationPermission()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
      carPlay: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User granted permission');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('User granted provisional permission');
    }else{
      print('User denied permission');
    }
  }

  Future<String> getDeviceToken() async{
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async{
    messaging.onTokenRefresh.listen((event){
      event.toString();
      print('Refresh token');
    });
  }
  
  void firebaseInit(BuildContext context){
    FirebaseMessaging.onMessage.listen((message){

      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());
      }
      if(Platform.isAndroid){
        initLocalNotifications(context , message);
        showNotification(message);
      }else{
        showNotification(message);
      }
    });
  }

  Future<void> showNotification(RemoteMessage message)async{
    
    AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
        Random.secure().nextInt(10000).toString(),
        'High Importance notification',
        importance: Importance.max
    );
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      androidNotificationChannel.id.toString(),
      androidNotificationChannel.name.toString(),
      channelDescription: 'My channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher',
    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    
    Future.delayed(Duration.zero , (){
    _flutterLocalNotificationsPlugin.show(
      id: 1,
      title: message.notification!.title.toString(),
      body: message.notification!.body.toString(),
      notificationDetails: notificationDetails,
      );
    });
  }

  void handleMessage(BuildContext context , RemoteMessage message){
    if(message.data['type'] == 'message'){
      Navigator.push(context,
      MaterialPageRoute(
          builder: (context) => MessageScreen(
             id: message.data['id'],
          ),
        )
      );
    }
  }

  Future<void> setupInteractMessage(BuildContext context)async{

    //WHEN APP IS CLOSED
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage != null){
      handleMessage(context, initialMessage);
    }

    // WHEN APP IS IN BACKGROUND
    FirebaseMessaging.onMessageOpenedApp.listen((event){
      handleMessage(context, event);
    });
  }
}