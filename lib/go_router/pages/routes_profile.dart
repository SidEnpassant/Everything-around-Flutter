import 'package:flutter/material.dart';

class RoutesProfile extends StatelessWidget {
  const RoutesProfile({super.key , required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text('Profile'),
            ),

          ),
          Text(username,
          style: TextStyle(
            color: Colors.black54,
          ),
          ),
        ],
      ),
    );
  }
}
