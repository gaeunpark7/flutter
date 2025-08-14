import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_provider.dart';

class CouterPage extends ConsumerWidget {
  const CouterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      body: Column(
        children: [
          Text("Counter: $counter"),
          ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: const Text("plus")),
          ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state--;
              },
              child: const Text("minus"))
        ],
      ),
    );
  }
}
