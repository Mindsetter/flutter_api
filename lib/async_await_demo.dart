import 'package:flutter/material.dart';

class AsyncDemo extends StatefulWidget {
  const AsyncDemo({super.key});

  @override
  State<AsyncDemo> createState() => _AsyncDemoState();
}

class _AsyncDemoState extends State<AsyncDemo> {
  // Future<void> getData() async {
  //   print('Waiting.....');
  //   await Future.delayed(const Duration(seconds: 5));
  //   print('Done');
  // }

  String? _name;
  int? _age;

  // Create async function to get Person info
  Future<Person> getPeronInfo(int id) async {
    print('Searching person info.......');
    await Future.delayed(const Duration(seconds: 2));
    switch (id) {
      case 1:
        return Person(1, 'John', 21);
      case 2:
        return Person(2, 'Peter', 22);
      case 3:
        return Person(3, 'Esi', 25);
      default:
        return Person(4, 'Joe', 30);
    }
  }

  //Create a function to retreive the data
  Future<void> getData(int id) async {
    var data = await getPeronInfo(id);
    setState(() {
      _name = data.name;
      _age = data.age;
    });
  }

  @override
  void initState() {
    super.initState();
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async & Await Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $_name',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age: $_age',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  getData(3);
                },
                child: const Text('Search Person'))
          ],
        ),
      ),
    );
  }
}

class Person {
  int id;
  String name;
  int age;

  Person(
    this.id,
    this.name,
    this.age,
  );
}
