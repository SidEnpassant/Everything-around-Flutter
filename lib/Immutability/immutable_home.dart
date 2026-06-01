import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class ImmutableHome extends StatelessWidget {
  const ImmutableHome({super.key});

  @override
  Widget build(BuildContext context) {
    final dogValueNotifier = DogValueNotifier(Dog.initial());
    return Scaffold(
      body: ValueListenableBuilder<Dog>(
        valueListenable: dogValueNotifier,
        builder: (context, dog , child) {
          return Center(
            child: Text('${dog.age}'),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => dogValueNotifier.value.age++,
      ),
    );
  }
}

class DogValueNotifier extends ValueNotifier<Dog>{
  DogValueNotifier(super.value);
  void birthDay(){
    this.value.age++;
  }

}

// mutable
class Dog{
  String name;
  int age;
  Dog({required this.name , required this.age});
  Dog.initial(): name = 'Spot' , age = 12;
}


// IMMUTABLE
@immutable
class ImmutableDog{
  final String name;
  final int age;
  ImmutableDog({required this.name , required this.age});
  ImmutableDog.initial(): name = 'Spot' , age = 12;

  ImmutableDog copyWith({
    String? name,
    int? age,
   }){
    return ImmutableDog(
        name: name ?? this.name,
        age: age ?? this.age,
    );
  }
}

class DogStateNotifier extends StateNotifier<Dog>{
  DogStateNotifier(super.value);
  void birthDay(){
    state = state.copyWith(age: state.age + 1);
  }

}