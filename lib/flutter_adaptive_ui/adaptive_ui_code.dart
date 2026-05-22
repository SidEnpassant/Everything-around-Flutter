import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptiveUiCode extends StatefulWidget {
  const AdaptiveUiCode({super.key});

  @override
  State<AdaptiveUiCode> createState() => _AdaptiveUiCodeState();
}

class _AdaptiveUiCodeState extends State<AdaptiveUiCode> {

  /// AppState object
  ui.FlutterView? _view;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _view = View.maybeOf(context);
  }
  void didChangeMetrics(){
    final ui.Display? display = _view?.display;
  }


// Inside app scaffold will call this and will pass mediaquery.sizeof
  void handleSizeChange(Size size){
    final orientations = <DeviceOrientation>[];
    orientations.addAll([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    bool isSmall = size.shortestSide < 600 && size != Size.zero;

    if(!isSmall){
      orientations.addAll([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    SystemChrome.setPreferredOrientations(orientations);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: SafeArea(// SafeArea to avoid intrusions like notches , camera cutouts , etc
        //     child: Column(
        //       children: [
        //
        //       ],
        //     )
        // )
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 840),
        child: GridView.builder(
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 4,
            // ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
            ),
            itemBuilder: (context , AsyncSnapshot){

            },
        ),
      )
    );
  }
}



