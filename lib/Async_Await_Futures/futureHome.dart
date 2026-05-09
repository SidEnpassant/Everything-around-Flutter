import 'dart:math';

import 'package:flutter/material.dart';

class Futurehome extends StatelessWidget {
  const Futurehome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            print('Future started - THEN');
            //var futureValue = await myFuture();
            // myFuture().then((value){
            //   print('Future finished - Then');
            // }).catchError((error){
            //   print(error);
            // });
            //runMultipleDownloads();
            var futureValue = await myTimedOutFuture().timeout(Duration(seconds: 2),onTimeout: (){
              print('This future has timed out');
              return 'This is my timeout value';
            });
            print('Future now here');
          }
      ),
    );
  }
  // Future<String> myFuture()async{
  //   await Future.delayed(Duration(seconds: 1));
  //   // return Future.value('This future is complete');
  //   //return Future.error('This is an error');
  //   throw Exception('Exception from error.');
  // }
  //  Future<bool> downloadFile(int id , int duration)async{
  //   await Future.delayed(Duration(seconds: duration));
  //   print('Download complete for $id');
  //   return true;
  //  }
  //  Future runMultipleDownloads() async{
  //   var futures = <Future>[];
  //   for(var i = 0 ; i < 10 ; i++){
  //     futures.add(downloadFile(i,Random(i).nextInt(10)));
  //   }
  //   print('Download Started');
  //   await Future.wait(futures);
  //   print('All downloads completed');
  //  }

  Future<String> myTimedOutFuture() async{
    print('Future started');
    await Future.delayed(Duration(seconds: 5));
    return 'Future Complete';
  }
}
