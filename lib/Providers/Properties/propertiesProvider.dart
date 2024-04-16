import 'package:flutter/material.dart';
import 'package:lease_managment/Fuctions/Properties/funciton_get_propertie.dart';
import 'package:lease_managment/models/properties.dart';

class PropertyDataProvider extends ChangeNotifier {
  List<Properties> propertiesData = [];
  List<Content> contentData = [];
  List<Content> filteredContent = [];
  List<Content> filteredContentApi = [];

  Future<void> fetchProperties() async {
    try {
      propertiesData = await ApiPropertiesGet().fetchProperties();
      if (propertiesData.isEmpty) {
        throw ('No properties found');
      }
      notifyListeners();
    } catch (e) {
      throw ('Error fetching properties: $e');
    }
  }

  Future<List<Content>>? fetchContent() async {
    try {
      contentData = await ApiPropertiesGet().fetchContent();
      return contentData;
    } catch (e) {
      throw ('Error fetching content: $e');
    }
  }

  void filterContent(String searchTerm) {
    if (searchTerm.isEmpty) {
      filteredContent = contentData;
    } else {
      filteredContent = contentData
          .where((content) =>
              content.address.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void filterContentApi({
    String? type,
    double? minPrice,
    double? maxPrice,
    int? rooms,
    int? bathrooms,
  }) async {
    filteredContentApi = await ApiPropertiesGet().filteredContent(
      type: type,
      minPrice: minPrice,
      maxPrice: maxPrice,
      rooms: rooms,
      bathrooms: bathrooms,
    );
    notifyListeners();
  }
}
