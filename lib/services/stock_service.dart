import 'dart:convert';
import 'package:http/http.dart' as http;

class StockService {
  final String apiUrl;

  StockService(this.apiUrl);

  Future<bool> checkItemStock(String itemUrl) async {
    final response = await http.post(
      Uri.parse('$apiUrl/check-stock'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'itemUrl': itemUrl}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['inStock'];
    } else {
      throw Exception('Failed to check stock');
    }
  }
}
