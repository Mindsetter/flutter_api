import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpDioDemo extends StatefulWidget {
  const HttpDioDemo({super.key});

  @override
  State<HttpDioDemo> createState() => _HttpDioDemoState();
}

class _HttpDioDemoState extends State<HttpDioDemo> {
  String _respond = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http & Dio Demo'),
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
              child: Container(
                child: Text(_respond),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Buid Request Method
  void httpRequest() async {
    try {
      // var respond = await http.post(
      //     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      //     body: {'name': 'Ebo', 'userId': '88', 'title': 'Flutter Http'});
      Dio dio = Dio();
      var respond = await dio.post('https://jsonplaceholder.typicode.com/posts',
          data: {'name': 'Ebo', 'userId': '88', 'title': 'Flutter Http'});
      _respond = respond.data.toString();
      print(respond.data.toString());
      print(respond.statusCode);
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
