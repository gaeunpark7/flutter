import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_study/provider/bloc/cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: Text("cubit counter")),
      body: Center(child: Text("${counterCubit.state}")),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 5),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
