import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  // Get the opened Box
  static final _gloceryList = Hive.box('glocery_list');
  // Read Data from Hive in Map<String, dynamic>
  static List<Map<String, dynamic>> getGloceries() {
    // Get data according it key
    var gloceryList = _gloceryList.keys.map((key) {
      // Get key assign value
      var value = _gloceryList.get(key);
      return {
        "key": key,
        "item": value['item'],
        "quantity": value['quantity'],
        "date": value['date'],
      };
    }).toList();
    return gloceryList; // Return a list of glocery items
  }

  // Add Glocery item to Hive (Create Data)
  static Future<void> addItem(Map<String, dynamic> newItem) async {
    await _gloceryList.add(newItem); // add new item into Hive
  }

  // Update Glocery item
  static Future<void> updateItem(
      int itemKey, Map<String, dynamic> changeItem) async {
    // Use put() to update
    // Update item using it key
    await _gloceryList.put(itemKey, changeItem);
  }

  // Delete Glocery item
  static Future<void> deleteItem(int itemKey) async {
    // Delete item using it key
    await _gloceryList.delete(itemKey);
  }
}
