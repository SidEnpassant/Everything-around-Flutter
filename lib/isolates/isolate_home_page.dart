import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateHomePage extends StatelessWidget {
  const IsolateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                CircularProgressIndicator(),

                // NORMAL - BLOCKING UI
                // ElevatedButton(
                //     onPressed: (){
                //       var total = complexTask();
                //       print('Total: $total');
                //     },
                //     child: const Text('Task 1'),
                // ),
                // OR
                ElevatedButton(
                  onPressed: ()async{
                    var total = await complexTask();
                    print('Total: $total');
                  },
                  child: const Text('Task 1'),
                ),
                // THIS OR THAT SAME THING WILL HAPPEN . BLOCKING UI



                
                // ISOLATE
                //ISOLATE a separate worker that runs code on its own thread with its own private memory heap
                // SO UI IS NOT BLOCKED IN THIS CASE
                ElevatedButton(
                  onPressed: ()async{
                    final receivePort = ReceivePort();
                    await Isolate.spawn(complexTask2, receivePort.sendPort); // spawn means creating a new instance
                    receivePort.listen((total){
                      debugPrint('Result 2: $total');
                    });
                  },
                  child: const Text('Task 2'),
                ),

              ],
            ),
          )
      ),
    );
  }
  Future<double> complexTask()async{
    var total = 0.0;
    for(var i = 0 ; i < 1000000000 ; i++){
      total += i;
    }
    return total;
  }

  // DOING THIS UI FREEZES WHEN THIS HEAVY complexTask TASK/CALCULATION IS PERFORMED ,AND DOING ASYNC AND AWAIT WILL
  // ALSO NOT WORK , SO ISOLATES IS THE SOLUTION
}

// END OF THIS PAGE

// OUTSIDE THE CLASS TO succeed IN Isolates
double complexTask2(SendPort sendPort){
  var total = 0.0;
  for(var i = 0 ; i < 1000000000 ; i++){
    total += i;
  }
  sendPort.send(total);
  return total;
}