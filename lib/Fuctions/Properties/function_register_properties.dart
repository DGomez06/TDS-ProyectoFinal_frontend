import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';

class ApiRegister {
  final Dio _dio = Dio();

  Future<int?> postRegisterProperty(
    String typeProperty,
    String address,
    String description,
    double price,
    String dimensions,
    int rooms,
    int bathrooms,
    double latitude,
    double longitude,
    List<XFile> image,
  ) async {
    try {
      const url = 'http://192.168.1.8:8060/api/v1/property';
      String? token = await ApiConexion().getToken();
      
      final response = await _dio.post(
        url,
        data: {
          'address': address,
          'description': description,
          'size': dimensions,
          'rooms': rooms,
          'bathrooms': bathrooms,
          'price': price,
          'longitude': longitude,
          'latitude': latitude,
          'type': typeProperty,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        int propertyId = response.data['id']; 
        bool success = await postPropertyImages(propertyId, image); // _image es la imagen que deseas enviar

        if (success) {
          return propertyId;
        }
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

   Future<bool> postPropertyImages(int propertyId, List<XFile> imageFiles) async {
    try {
      String? token = await ApiConexion().getToken();
      const urlBase = 'http://192.168.1.8:8060/api/v1/storage/';
      for (int i = 0; i < imageFiles.length; i++) {
        final XFile imageFile = imageFiles[i];
        List<int> fileBytes = await imageFile.readAsBytes();
        FormData formData = FormData.fromMap({
          'file': MultipartFile.fromBytes(
            fileBytes,
            filename: 'image_$i.jpg', 
            contentType: MediaType('image', 'jpeg'), 
          ),
        });
        final url = '$urlBase$propertyId';
        final response = await _dio.post(
          url,
          data: formData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'multipart/form-data',
            },
          ),
        );
        if (response.statusCode == 200) {
          print('Imagen $i subida correctamente');
        } else {
          print('Error al subir la imagen $i');
        }
      }

      return true; 
    } catch (e) {
      print(e);
      return false;
    }
  }
}