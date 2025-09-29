import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_study/provider/bloc/counter_bloc.dart';
import 'package:widget_study/provider/bloc/counter_event.dart';
import 'package:widget_study/provider/bloc/counter_state.dart';

class CouterBlocPage extends StatefulWidget {
  const CouterBlocPage({super.key});

  @override
  State<CouterBlocPage> createState() => _CouterBlocPageState();
}

class _CouterBlocPageState extends State<CouterBlocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text("");
          },
        ),
      ),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
            },
          ),
          FloatingActionButton(onPressed: () {}),
        ],
      ),
    );
  }
}
