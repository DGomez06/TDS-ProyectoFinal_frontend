import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:lease_managment/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConexion {
  Dio dio = Dio();
  String base = 'http://192.168.1.8:8060/api/v1/auth';

  Future<void> registerUserAndGetToken(User user) async {
    try {
      final response = await dio.post('$base/register', data: user.toJson());
      return response.data;
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

      final response = await dio.post(
        '$base/authenticate',
        data: {'email': user, 'password': password},
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['token']);
        return 'Correcto';
      } else {
        throw Exception('Error al iniciar sesión: ${response.data}');
      }
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

  Future<bool> verifyToken(String resetToken) async {
    try {
      final response = await dio.post(
        '$base/verify-token',
        data: {'resetToken': resetToken},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Error al verificar el token: ${response.data}');
      }
    } catch (e) {
      return false;
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

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = StringBuffer();
    final String formattedText =
        newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (formattedText.length >= 4) {
      newText.write('${formattedText.substring(0, 3)}-');
      if (formattedText.length >= 7) {
        newText.write('${formattedText.substring(3, 6)}-');
        newText.write(formattedText.substring(6, formattedText.length));
      } else {
        newText.write(formattedText.substring(3, formattedText.length));
      }
    } else {
      newText.write(formattedText);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
