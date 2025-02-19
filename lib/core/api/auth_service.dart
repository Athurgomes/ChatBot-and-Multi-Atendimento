import 'package:http/http.dart' as http;
import 'api_client.dart';

class AuthService {
  static Future<http.Response> login(String email, String senha) async {
    return await ApiClient.post('auth/login', {
      'email': email,
      'senha': senha
    });
  }

  static Future<http.Response> register(Map<String, dynamic> userData) async {
    return await ApiClient.post('auth/register', userData);
  }
}