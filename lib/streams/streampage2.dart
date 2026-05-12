// SINGLE STREAM

// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class Streampage2 extends StatefulWidget {
//   const Streampage2({super.key});
//
//   @override
//   State<Streampage2> createState() => _Streampage2State();
// }
//
// class _Streampage2State extends State<Streampage2> {
//   StreamController<String> streamController = StreamController<String>();
//   TextEditingController textEditingController = TextEditingController();
//
//   @override
//   void dispose() {
//     streamController.close();
//     textEditingController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               StreamBuilder<String>(
//                 stream: streamController.stream,
//                 builder: (context, snapshot) {
//                   if(snapshot.hasData){
//                     return Text(
//                       snapshot.data.toString(),
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                     );
//                   }else{
//                     return Text('NO DATA',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                     );
//                   }
//
//                 }
//               ),
//               const SizedBox(
//                 height: 26,
//               ),
//               SizedBox(
//                 width: 200,
//                   child: TextField(
//                     controller: textEditingController,
//                   )
//               ),
//               const SizedBox(
//                 height: 26,
//               ),
//               ElevatedButton(
//                   onPressed: (){
//                     print(textEditingController.text);
//                     streamController.add(textEditingController.text);
//                   },
//                   child: Text('done')
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// MULTIPLE STREAMS
import 'dart:async';

import 'package:flutter/material.dart';

class Streampage2 extends StatefulWidget {
  const Streampage2({super.key});

  @override
  State<Streampage2> createState() => _Streampage2State();
}

class _Streampage2State extends State<Streampage2> {
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream(); // multiple streams are created
    super.initState();

  }
  @override
  void dispose() {
    streamController.close();
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                  stream: dataStream,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      );
                    }else{
                      return Text('NO DATA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      );
                    }

                  }
              ),

              StreamBuilder<String>(
                  stream: dataStream,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      );
                    }else{
                      return Text('NO DATA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      );
                    }

                  }
              ),
              const SizedBox(
                height: 26,
              ),
              SizedBox(
                  width: 200,
                  child: TextField(
                    controller: textEditingController,
                  )
              ),
              const SizedBox(
                height: 26,
              ),
              ElevatedButton(
                  onPressed: (){
                    print(textEditingController.text);
                    streamController.add(textEditingController.text);
                  },
                  child: Text('done')
              )
            ],
          ),
        ),
      ),
    );
  }
}