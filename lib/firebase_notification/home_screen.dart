import 'package:flutter/material.dart';
import 'package:testapp/firebase_notification/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value){
      print('Device Token - ${value}');
    });
    notificationServices.firebaseInit(context);
    // notificationServices.isTokenRefresh();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
        style: TextStyle(
          color: Colors.white,
         ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
