import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lease_managment/models/products.dart';

class ApiClient {
  final Dio _dio = Dio();



Future<List<Properties>> fetchProperties() async {
  const url = 'https://retoolapi.dev/Z5Zyc2/data';
  
  final response = await _dio.get(url);
  
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;
    final List<Properties> properties = responseData.map((data) => Properties.fromJson(data)).toList();
    return properties;
  } else {
    throw Exception('Failed to load properties');
  }
}

List<Properties> properties = [];

// Función para agregar una nueva propiedad
  Future<void> addNewProperty(Properties newProperty) async {
    try {
      const url = 'https://retoolapi.dev/Z5Zyc2/data';
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(newProperty.toJson());
      final response = await _dio.post(url, data: body, options: Options(headers: headers));

      if (response.statusCode == 200 || response.statusCode == 201) {
          print('Nueva propiedad agregada correctamente');
          final List<Properties> updatedList = await fetchProperties();
          properties = updatedList;
        } else {
          throw Exception('Error al agregar la propiedad: ${response.statusCode}');
        }
    } catch (e) {

      throw Exception('Error al agregar la propiedad: $e');
    }
  }


  Future<List<String>> fetchRandomImageUrls(int count) async {
  List<String> urls = [];
    try {
      for (int i = 0; i < count; i++) {
        final response = await _dio.get('https://picsum.photos/200?random=$i');
        if (response.statusCode == 200) {
          urls.add(response.requestOptions.uri.toString());
        } else {
          throw Exception(
              'Error al cargar la imagen aleatoria: ${response.statusCode}');
        }
      }
      return urls;
    } catch (e) {
      throw Exception('Error al cargar las imágenes aleatorias: $e');
    }
  }



}