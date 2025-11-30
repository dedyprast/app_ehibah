import 'package:flutter/material.dart';

class CounterTextWidget extends StatelessWidget {
  final int? counter;

  const CounterTextWidget({super.key, this.counter});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You have pushed the button this many times:'),
        Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
