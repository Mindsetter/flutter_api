import 'package:flutter/material.dart';
import 'package:flutter_api/hive_helper.dart';

class HiveFlutterDemo extends StatefulWidget {
  const HiveFlutterDemo({super.key});

  @override
  State<HiveFlutterDemo> createState() => _HiveFlutterDemoState();
}

class _HiveFlutterDemoState extends State<HiveFlutterDemo> {
  List<Map<String, dynamic>> _gloceryItems = [];
  @override
  void initState() {
    setState(() {
      _gloceryItems = HiveHelper.getGloceries();
    });
    super.initState();
  }

  final _itemController = TextEditingController();
  final _quantiityController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hive Glocery'),
        centerTitle: true,
      ),
      body: _gloceryItems.isEmpty
          ? const Center(
              child: Text(
                'No Glocery Items added yet!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _gloceryItems.length,
              itemBuilder: (context, index) {
                final item = _gloceryItems[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(item['item']),
                    subtitle: Text(item['date']),
                    leading: Text(item['quantity']),
                    trailing: IconButton(
                      onPressed: () {
                        HiveHelper.deleteItem(item['key']);
                        setState(() {
                          _gloceryItems = HiveHelper.getGloceries();
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    onTap: () {
                      HiveHelper.updateItem(
                        item['key'],
                        {},
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          gloceryModel(context);
        },
      ),
    );
  }

  // Create an alert dialog to add item
  void gloceryModel(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(_itemController, 'Item'),
              const SizedBox(height: 10),
              _buildTextField(_quantiityController, 'Quantity'),
              const SizedBox(height: 10),
              _buildTextField(_dateController, 'Date'),
              const SizedBox(height: 10),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  HiveHelper.addItem({
                    'item': _itemController.text,
                    'quantity': _quantiityController.text,
                    'date': _dateController.text,
                  });
                  _itemController.clear();
                  _quantiityController.clear();
                  _dateController.clear();

                  setState(() {
                    _gloceryItems = HiveHelper.getGloceries();
                    Navigator.of(context).pop();
                  });
                },
                child: const Text('Add Item'))
          ],
        );
      },
    );
  }
  // Create TextField Builder

  TextField _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
      ),
    );
  }
}
