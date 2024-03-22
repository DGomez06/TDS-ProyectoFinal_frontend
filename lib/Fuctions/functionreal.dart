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

  Future<void> resetPassword(String resetToken, String newPassword) async {
    Map<String, String> passwordMap = {
      'resetToken': resetToken,
      'newPassword': newPassword,
    };

    try {
      final response = await dio.post('$base/reset-password',
          data: passwordMap,
          options: Options(
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
          ));

      // Comprueba si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        return;
      } else {
        // Si la solicitud falla, imprime el mensaje de error recibido del servidor
        throw Exception('Error al restablecer la contraseña: ${response.data}');
      }
    } catch (e) {
      // Maneja cualquier error de red o excepción
      throw Exception('Error al restablecer la contraseña: $e');
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
