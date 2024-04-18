import 'package:dio/dio.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/models/favorites.dart';
import 'package:lease_managment/models/properties.dart';

class ApiPropertiesGet {
  final Dio _dio = Dio();
  String url = 'http://10.0.0.41:8060/api/v1/property';

  Future<List<Properties>> fetchProperties() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List<Properties> properties = [];
        final Map<String, dynamic> data = response.data;

        final property = Properties.fromJson(data);
        properties.add(property);

        return properties;
      } else {
        throw Exception('Failed to load properties');
      }
    } catch (e) {
      throw Exception('Error fetching properties: $e');
    }
  }

  Future<List<Content>> fetchContent() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List<Content> content = response.data['content']
            .map<Content>((json) => Content.fromJson(json))
            .toList();

        return content;
      } else {
        throw Exception('Failed to load content');
      }
    } catch (e) {
      throw Exception('Error fetching content: $e');
    }
  }

  Future<List<Content>> filteredContent({
    String? type,
    double? minPrice,
    double? maxPrice,
    int? rooms,
    int? bathrooms,
  }) async {
    const baseUrl = 'http://10.0.0.41:8060/api/v1/property?page=0';
    String url = baseUrl;

    if (type != null && type.isNotEmpty) {
      url += '&type=$type';
    }

    if (minPrice != null &&
        maxPrice != null &&
        minPrice >= 0 &&
        maxPrice >= 0) {
      url += '&minPrice=$minPrice&maxPrice=$maxPrice';
    }

    if (rooms != null && rooms > 0) {
      url += '&rooms=$rooms';
    }

    if (bathrooms != null && bathrooms > 0) {
      url += '&bathrooms=$bathrooms';
    }

    try {
      final Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        final List<Content> contentList = (response.data['content'] as List)
            .map((json) => Content.fromJson(json))
            .toList();
        return contentList;
      } else {
        throw Exception('Failed to load content');
      }
    } catch (e) {
      throw Exception('Error fetching content: $e');
    }
  }

  Future<List<Favorites>> fetchContentByFavorite() async {
    String? token = await ApiConexion().getToken();
    try {
      final response = await _dio.get(
        '$url/favorites',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        List<Favorites> contentList = [];
        final List<dynamic> data = response.data;
        for (var item in data) {
          final content = Favorites.fromJson(item);
          contentList.add(content);
        }
        return contentList;
      } else {
        throw Exception('Failed to load content');
      }
    } catch (e) {
      throw Exception('Error fetching content: $e');
    }
  }

  Future<void> deleteFavorite(int propertyId) async {
    String? token = await ApiConexion().getToken();

    try {
      final response = await _dio.delete(
        '$url/favorites/$propertyId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to delete favorite');
      }
    } catch (e) {
      throw Exception('Error deleting favorite: $e');
    }
  }

  Future<List<Content>> getPropertiesOwner() async {
    String? token = await ApiConexion().getToken();

    try {
      final response = await _dio.get(
        '$url/owner',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Content> contentList =
            data.map((json) => Content.fromJson(json)).toList();
        return contentList;
      } else {
        throw Exception('Failed to load content');
      }
    } catch (e) {
      throw Exception('Error fetching content: $e');
    }
  }
}
