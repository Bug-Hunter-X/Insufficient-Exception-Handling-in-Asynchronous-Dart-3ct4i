```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } on FormatException catch (e) {
        print('Error: Invalid JSON format - $e');
        // Handle the JSON parsing error appropriately.
        return null; // Or throw a custom exception
      }
    } else if (response.statusCode == 404) {
      print('Error: Data not found (404)');
      return null; // Or handle the 404 error as needed
    } else {
      print('Error: HTTP request failed with status: ${response.statusCode}');
      throw Exception('HTTP request failed');
    }
  } catch (e) {
    print('An unexpected error occurred: $e');
    //Consider logging the error to a service like Sentry or Firebase Crashlytics for monitoring
    rethrow; // Re-throw to allow handling further up the call stack if needed.
  }
}
```