import 'package:flutter/material.dart';
import 'package:testapp/sqflite/services/database_service.dart';

import 'models/task.dart';

class HomePageSqflite extends StatefulWidget {
  const HomePageSqflite({super.key});

  @override
  State<HomePageSqflite> createState() => _HomePageSqfliteState();
}

class _HomePageSqfliteState extends State<HomePageSqflite> {
  String? _task = null;
  final DatabaseService _databaseService = DatabaseService.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addTaskButton(),
      body: _tasksList(),
    );
  }
  Widget _addTaskButton(){
    return FloatingActionButton(
        onPressed: (){
          showDialog(
          context: context,
              builder: (_) => AlertDialog(
                title: const Text('Add Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value){
                        setState(() {
                          _task = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Subscribe'
                      ),
                    ),
                    MaterialButton(
                      color: Theme.of(context).colorScheme.primary,
                        child: const Text('Done',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                        onPressed: (){
                        if(_task == null || _task == "") return;
                        _databaseService.addTask(_task!);
                        setState(() {
                          _task = null;
                        });
                        Navigator.pop(context);
                        },
                    )
                  ],
                ),
              ),
          );
        },
        child: const Icon(Icons.add),
    );
  }

  Widget _tasksList(){
    return FutureBuilder(
        future: _databaseService.getTasks(),
        builder: (context , snapshot){
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context , index){
              Task task = snapshot.data![index];
                return ListTile(
                  onLongPress: (){
                    _databaseService.deleteTask(task.id);
                    setState(() {

                    });
                  },
                  title: Text(task.content),
                  trailing: Checkbox(
                      value: task.status == 1,
                      onChanged: (value){
                        _databaseService.updateTaskStatus(
                            task.id, value == true ? 1 : 0,

                        );
                        setState(() {

                        });
                      }),
                );
              }
          );
        }
    );
  }
}
