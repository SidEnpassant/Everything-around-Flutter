import 'package:flutter/material.dart';

class RoutesAbout extends StatelessWidget {
  const RoutesAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('About us'),
        ),
      ),
    );
  }
}
