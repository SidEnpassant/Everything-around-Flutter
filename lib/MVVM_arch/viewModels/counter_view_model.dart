
import 'package:flutter/cupertino.dart';
import 'package:testapp/MVVM_arch/models/counter_model.dart';

class CounterViewModel extends ChangeNotifier{
  CounterModel _counterModel = CounterModel(counter: 0);
  int get counter => _counterModel.counter;
  void incrementCounter(){
    _counterModel.counter++;
    notifyListeners();
  }
}