

// void main()async{
//   print('Future Started');
//   // String v = await fetchData().then((v){
//   //   print(v);
//   // });
//   String v = await fetchData();
//   print(v);
//   print('Moving Ahead');
// }
//
// Future<String> fetchData()async{
//   await Future.delayed(Duration(seconds: 4));
//   return 'FUTURE COMPLETED';
// }



// ERROR HANDLING - HOW

void main()async{
  print('Future Started');
  try{
    String v = await fetchData();
    print(v);
  }catch(e){
    print('ERROR OCCURED');
  }finally{
    // any cleanup logic or anything need to happend after try catch done executing
    print('FINALLY');
  }
  print('Moving Ahead');
}

//WHEN ERROR
Future<String> fetchData()async{
  await Future.delayed(Duration(seconds: 4));
  throw Exception();

}

//WHEN SUCCESS
// Future<String> fetchData()async{
//   await Future.delayed(Duration(seconds: 4));
//   return 'FUTURE COMPLETED';
// }