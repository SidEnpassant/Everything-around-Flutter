import 'package:flutter/material.dart';

import '../shared/screenTitle.dart';
import '../shared/tripList.dart';


class TripAnimationsHome extends StatefulWidget {
  const TripAnimationsHome({super.key});

  @override
  _TripAnimationsHomeState createState() => _TripAnimationsHomeState();
}

class _TripAnimationsHomeState extends State<TripAnimationsHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            SizedBox(
              height: 160,
              child: ScreenTitle(text: 'Ninja Trips'),
            ),
            Flexible(
              child: TripList(),
            )
            //Sandbox(),
          ],
        )
      )
    );
  }
}

