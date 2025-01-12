```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the response body is a JSON string
      final jsonData = jsonDecode(response.body);
      // Access data from jsonData
      print(jsonData['key']);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the exception appropriately.  Consider the type of error
    // This is crucial to avoid silent failures or unexpected behavior.
    print('Error: $e');
    rethrow; // Re-throw the exception to allow handling further up the call stack.
  }
}
```