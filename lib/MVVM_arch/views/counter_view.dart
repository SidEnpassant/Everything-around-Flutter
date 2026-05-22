import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/MVVM_arch/viewModels/counter_view_model.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<CounterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with MVVM'),
      ),
      body: Center(
        child: Text('Counter ${viewModel.counter}'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            viewModel.incrementCounter();
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}
