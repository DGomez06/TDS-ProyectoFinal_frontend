import 'dart:math';

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

  Future<bool> updateData(
      String firstName, String lastName, String email, String phone) async {
    String? token = await ApiConexion().getToken();
    String url = 'http://192.168.1.8:8060/api/v1';
    try {
      final response = await dio.put(
        '$url/user',
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phone": phone
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteUserData() async {
    String? token = await ApiConexion().getToken();
    String url = 'http://192.168.1.8:8060/api/v1';
    try {
      final response = await dio.delete(
        '$url/user',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
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

  Future<bool> changePassword(String newPassword) async {
    String? token = await getToken();

    try {
      await dio.post('http://192.168.1.8:8060/api/v1/user',
          data: {"password": newPassword},
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      return true;
    } catch (e) {
      return false;
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

  Future<String?> getTokenNorify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('notiToken');
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

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = StringBuffer();
    final String formattedText =
        newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (formattedText.isNotEmpty) {
      // Formatear los primeros 16 caracteres con espacios cada 4 caracteres
      for (int i = 0; i < formattedText.length; i++) {
        if (i > 0 && i % 4 == 0) {
          newText.write(' '); // Agregar un espacio cada 4 caracteres
        }
        newText.write(formattedText[i]);
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class MonthYearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedText =
        newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (formattedText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final StringBuffer newText = StringBuffer();
    newText
        .write(formattedText.substring(0, min(formattedText.length, 2))); // MM
    if (formattedText.length > 2) {
      newText.write(
          '/${formattedText.substring(2, min(formattedText.length, 4))}'); // YY
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
