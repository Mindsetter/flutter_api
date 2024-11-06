import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  const StreamDemo({super.key});

  @override
  State<StreamDemo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: counter(),
          initialData: 0,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
