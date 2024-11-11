import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDemo extends StatefulWidget {
  const SharedPrefDemo({super.key});

  @override
  State<SharedPrefDemo> createState() => _SharedPrefDemoState();
}

class _SharedPrefDemoState extends State<SharedPrefDemo> {
  String? _text;
  Future<void> storeData() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setString('text', 'Hellooooo');
  }

  Future<void> fetchData() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    String? text = await asyncPrefs.getString('text');
    setState(() {
      _text = text ?? 'No Data';
    });
  }

  @override
  void initState() {
    storeData();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shared Preferences'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '$_text',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
