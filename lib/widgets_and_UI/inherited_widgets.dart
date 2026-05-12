import 'package:flutter/material.dart';

class InheritedNose extends InheritedWidget{
  final Image asset;
  const InheritedNose({super.key , required Widget child , required this.asset}) : super(child: child);


  static InheritedNose? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedNose>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}


class FilipWidget extends StatelessWidget {
  const FilipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nose = InheritedNose.of(context)?.asset;
    return Scaffold();
  }
}
