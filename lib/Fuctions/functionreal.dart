import 'package:dio/dio.dart';
import 'package:lease_managment/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConexion {
  Dio _dio = Dio();
  String base = 'http://10.0.0.2:8060/api/v1/auth';

  Future<String> registerUserAndGetToken(User user) async {
    try {
      final response = await _dio.post('$base/register', data: user.toJson());
      final token = response.data['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return token;
    } catch (e) {
      throw Exception('Error al registrar el usuario: $e');
    }
  }

  Future<String> login(String user, String password) async {
    try {
      final token = await getToken();
      if (token == null) {
        throw Exception('No se encontró un token almacenado');
      }

      await _dio.post(
        '$base/login',
        data: {'user': user, 'password': password},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return 'Correcto';
    } catch (e) {
      return 'Incorrecto';
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
