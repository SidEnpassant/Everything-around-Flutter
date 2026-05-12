import 'package:flutter/material.dart';
import 'package:testapp/LayoutBuilder_and_MediaQuerys/home_landscape_L_&_M.dart';
import 'package:testapp/LayoutBuilder_and_MediaQuerys/home_portrait_L_&_M.dart';


class HomeScreenLM extends StatelessWidget {
  const HomeScreenLM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      //body: MediaQuery.of(context).orientation == Orientation.portrait ? HomePortrait() : HomeLandscape(),
    body: LayoutBuilder(
        builder: (context , constraints){
          print(constraints.maxHeight);
          if(constraints.maxHeight < 600){
            return HomeLandscape();
          }else{
            return HomePortrait();
          }
          //return HomePortrait();
        }
    ),
    );
  }
}
