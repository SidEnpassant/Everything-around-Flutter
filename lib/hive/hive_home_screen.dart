import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveHomeScreen extends StatefulWidget {
  const HiveHomeScreen({super.key});

  @override
  State<HiveHomeScreen> createState() => _HiveHomeScreenState();
}

class _HiveHomeScreenState extends State<HiveHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Database'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: Hive.openBox('Siddhes'),
              builder: (context , snapshot){
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('name').toString()),
                      subtitle: Text(snapshot.data!.get('age').toString()),
                      trailing: IconButton(
                          //// ------ EDIT ------- \\\\
                          // onPressed: (){
                          //   snapshot.data!.put('name', 'Siddhes');
                          //   snapshot.data!.put('age', 78);
                          //   setState(() {
                          //
                          //   });
                          // },
                          // icon: Icon(Icons.edit),

                        /// -------- DELETE ----------- \\\\\
                         onPressed: (){
                           snapshot.data!.delete('name');
                           snapshot.data!.delete('age');
                           setState(() {

                           });
                         },
                        icon: Icon(Icons.delete),
                     ),
                    ),
                    //Text(snapshot.data!.get('list')['cash'].toString()),
                  ],
                );
              }
          ),
          FutureBuilder(
              future: Hive.openBox('Name'),
              builder: (context , snapshot){
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('Youtube').toString()),

                    ),

                  ],
                );
              }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            var box = await Hive.openBox('Siddhes');
            var box2 = await Hive.openBox('Name');
            box2.put('Youtube', 'SidOyeam');
            box.put('name', 'Siddhes Das');
            box.put('age', 34);
            box.put('list', {
              'pro' : 'developer',
              'cash' : 2133,
            });
            print(box.get('name'));
            print(box.get('age'));
            print(box.get('list')['cash']);
            print(box.get('list')['pro']);
            setState(() {

            });
          },
          child: Icon(Icons.add),
      ),
    );
  }
}