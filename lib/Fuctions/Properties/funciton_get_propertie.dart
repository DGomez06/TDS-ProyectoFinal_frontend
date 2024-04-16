import 'package:dio/dio.dart';
import 'package:lease_managment/models/properties.dart';

class ApiPropertiesGet {
  final Dio _dio = Dio();

  Future<List<Properties>> fetchProperties() async {
    const url = 'http://192.168.1.8:8060/api/v1/property';

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
    const url = 'http://192.168.1.8:8060/api/v1/property';

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
    const baseUrl = 'http://192.168.1.8:8060/api/v1/property?page=0';
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
}
