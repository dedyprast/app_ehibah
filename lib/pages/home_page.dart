import 'package:flutter/material.dart';
import 'package:app_ehibah/widgets/counter_text_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    print('HomePage InitState Called');
    _counter = 10;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print('Incrementing Counter: $_counter');
  }

  @override
  Widget build(BuildContext context) {
    print('HomePage Build Method Called: $_counter');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: CounterTextWidget(counter: _counter)),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
