import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'http://localhost:5000/api';
  static final client = http.Client();

  static Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    return await client.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: body,
    );
  }

  // Adicionar outros métodos (get, put, delete)
}