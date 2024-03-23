import 'package:dio/dio.dart';
import 'package:lease_managment/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConexion {
  Dio dio = Dio();
  String base = 'http://10.0.0.2:8060/api/v1/auth';

  Future<String> registerUserAndGetToken(User user) async {
    try {
      final response = await dio.post('$base/register', data: user.toJson());
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

      await dio.post(
        '$base/authenticate',
        data: {'email': user, 'password': password},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return 'Correcto';
    } catch (e) {
      return 'Incorrecto';
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await dio.post('$base/forgot-password', data: {'email': email});
      return;
    } catch (e) {
      throw Exception('Error al enviar el correo: $e');
    }
  }

  Future<String> verifyToken(String resetToken) async {
    try {
      final response = await dio.post(
        '$base/verify-token',
        data: {'resetToken': resetToken},
      );
      if (response.statusCode == 200) {
        return 'Token verificado correctamente';
      } else {
        throw Exception('Error al verificar el token: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error al verificar el token: $e');
    }
  }

  Future<String> resetPassword(String resetToken, String newPassword) async {
    try {
      final response = await dio.post(
        '$base/reset-password',
        data: {'resetToken': resetToken, 'newPassword': newPassword},
      );
      if (response.statusCode == 200) {
        return 'Contraseña restablecida correctamente';
      } else {
        throw Exception('Error al restablecer la contraseña: ${response.data}');
      }
    } catch (e) {
      return 'Error al restablecer la contraseña';
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    return;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
