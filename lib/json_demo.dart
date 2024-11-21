import 'package:flutter/material.dart';
import 'package:flutter_api/user_model.dart';
import 'package:dio/dio.dart';

class JsonDemo extends StatefulWidget {
  const JsonDemo({super.key});

  @override
  State<JsonDemo> createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  String _respond = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            child: ElevatedButton(
              onPressed: () {
                httpRequest();
              },
              child: const Text('Retreive Htttp Request'),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_respond),
            ),
          ),
        ],
      ),
    );
  }

  //Buid Request Method
  void httpRequest() async {
    try {
      // var respond = await http.get(
      //   Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      // );
      // var data = jsonDecode(respond.body) as Map<String, dynamic>;

      Dio dio = Dio();
      var respond = await dio.get(
        'https://jsonplaceholder.typicode.com/posts/1',
      );
      User data = User.fromJson(respond.data);
      _respond = data.title!;
      // print(data.body);
      // print(respond.statusCode);
    } catch (e) {
      // return errors
      _respond = 'Error here: $e';
    } finally {
      setState(() {
        // rebuid the widget
      });
    }
  }
}
