import 'package:flutter/material.dart';
import 'package:lease_managment/Fuctions/Properties/funciton_get_propertie.dart';
import 'package:lease_managment/Fuctions/Properties/function_register_properties.dart';
import 'package:lease_managment/models/favorites.dart';
import 'package:lease_managment/models/properties.dart';

class PropertyDataProvider extends ChangeNotifier {
  List<Properties> propertiesData = [];
  List<Content> contentData = [];
  List<Content> filteredContent = [];
  List<Content> filteredContentApi = [];
  List<Favorites> favData = [];
  List<Favorites> favContent = [];
  Map<int, bool> favoriteMap = {};
  List<Content> getownerProperties = [];

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

  Future<List<Content>> fetchOwnerProperties() async {
    try {
      getownerProperties = await ApiPropertiesGet().getPropertiesOwner();
      return getownerProperties;
    } catch (e) {
      throw ('Error fetching properties: $e');
    }
  }

  Future<List<Content>>? fetchContent() async {
    try {
      contentData = await ApiPropertiesGet().fetchContent();
      if (favoriteMap.isEmpty) {
        favoriteMap = {for (var content in contentData) content.id: false};
      }
      return contentData;
    } catch (e) {
      throw ('Error fetching content: $e');
    }
  }

  Future<List<Favorites>>? fetchFavContent() async {
    try {
      favContent = await ApiPropertiesGet().fetchContentByFavorite();
      return favContent;
    } catch (e) {
      throw ('Error fetching content: $e');
    }
  }

  Future<void> toggleFavorite(int id) async {
    if (favoriteMap.containsKey(id)) {
      final isFavorite = favoriteMap[id]!;
      try {
        if (isFavorite) {
          await deleteFavorite(id);
          favoriteMap[id] = false;
        } else {
          await addFavorite(id);
          favoriteMap[id] = true;
        }
        notifyListeners();
      } catch (e) {
        // Manejar errores
      }
    }
  }

  Future<void> addFavorite(int id) async {
    try {
      await ApiRegister().postFavoriteProperty(id);
      favoriteMap[id] = true;
      if (favContent.isEmpty) {
        favContent = await ApiPropertiesGet().fetchContentByFavorite();
      } if (favData.isEmpty) {
        favData = await ApiPropertiesGet().fetchContentByFavorite();
        favContent
          .add(favData.firstWhere((element) => element.property.id == id));
      }
    } catch (e) {
      throw ('Error adding favorite: $e');
    }
  }

  Future<void> deleteFavorite(int favoriteId) async {
    try {
      final favoriteEntry =
          favContent.firstWhere((element) => element.property.id == favoriteId);
      final propertyId = favoriteEntry.id;
      await ApiPropertiesGet().deleteFavorite(propertyId);
      favContent.remove(favoriteEntry);
      favoriteMap[favoriteId] = false;
    } catch (e) {
      throw Exception('Error deleting favorite: $e');
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

  int getTotalPropertiesByOwner() {
    return getownerProperties.length;
  }
}
