import 'package:chapter17_provider/counter_stateprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counterpage extends ConsumerStatefulWidget {
  const Counterpage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterpageState();
}

class _CounterpageState extends ConsumerState<Counterpage> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod part1")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Number count: $counter", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: Text("plus"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state--;
                },
                child: Text("minus"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
