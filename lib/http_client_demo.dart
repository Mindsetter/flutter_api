import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientDemo extends StatefulWidget {
  const HttpClientDemo({super.key});

  @override
  State<HttpClientDemo> createState() => _HttpClientDemoState();
}

class _HttpClientDemoState extends State<HttpClientDemo> {
  String _respond = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpClient Demo'),
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
      // init HttpClient
      HttpClient client = HttpClient();
      // Send Http Request
      HttpClientRequest request = await client
          .getUrl(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      // Waiting for Http Response
      HttpClientResponse response = await request.close();
      _respond = await response.transform(utf8.decoder).join();
      client.close();
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
