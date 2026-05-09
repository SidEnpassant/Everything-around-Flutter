import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Streampage extends StatefulWidget {
  const Streampage({super.key});

  @override
  State<Streampage> createState() => _StreampageState();
}

class _StreampageState extends State<Streampage> {
  StreamController<double> controller = StreamController<double>();
  StreamSubscription<double>? streamSubscription;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      streamSubscription?.cancel();
      controller.close();
      super.dispose();
    }
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MaterialButton(
              child: Text('Subscribe'),
              color: Colors.yellow,
                onPressed: ()async{
                // Stream<double> stream = controller.stream;
                // streamSubscription = stream.listen((value){
                //   print('Value from the controller $value');
                // });
                //   var value1 = await getDelayedRandomValue();
                //   var value2 = await getDelayedRandomValue();
                  getDelayedRandomValue().listen((value){
                    print('Value from manual Stream: ${value}');
                  });
              }
            ),
            MaterialButton(
                child: Text('Emit value'),
                color: Colors.blue,
                onPressed: (){
                  controller.add(12);
                }
            ),
            MaterialButton(
                child: Text('Unsubscribe'),
                color: Colors.red,
                onPressed: (){
                  streamSubscription?.cancel();
                }
            )
          ],
        ),
      ),
    );
  }
  Stream<double> getDelayedRandomValue()async*{
    var random = Random();
    while(true){
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
}
