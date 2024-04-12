import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lease_managment/Fuctions/funcitonsApiRamdon.dart';
import 'package:lease_managment/models/products.dart';

class StatusProvider extends ChangeNotifier {
  bool _hideContainer = false;

  List<Properties> _propertiesData = [];
  final List<Properties> _selectedProperties = [];

  List<String> _propertiesImage = [];
  final List<String> _propertiesImageList = [];
  final ApiClient _apiClient = ApiClient();
  String _searchTerm = '';
  String _selectedCategory = '';
  String _selectedSubCategory = '';
  int _value1 = 0;
  int _value2 = 0;
  int _selectedIndex = 0;

  bool get hideContainer => _hideContainer;
  int get selectedIndex => _selectedIndex;
  ApiClient get apiClient => _apiClient;

  List<Properties> get propertiesData => _propertiesData;
  List<Properties> get addedPropertiesList => _selectedProperties;
  List<String> get propertiesImage => _propertiesImage;
  List<String> get propertiesImageList => _propertiesImageList;
  String get selectedCategory => _selectedCategory;
  String get selectedSubCategory => _selectedSubCategory;
  int get value1 => _value1;
  int get value2 => _value2;

  String get getSearchTerm => _searchTerm;

  Future<void> fetchPropertiesAndImages() async {
  try {
    _propertiesData = await _apiClient.fetchProperties();
    _propertiesImage = await _apiClient.fetchRandomImageUrls(_propertiesData.length);
    
    // Asociar cada URL de imagen aleatoria con una propiedad aleatoria
    for (var property in _propertiesData) {
      int randomIndex = Random().nextInt(_propertiesImage.length);
      propertiesImage[randomIndex] = _propertiesImage[randomIndex];
    }
    
    notifyListeners();
  } catch (e) {
    throw ('Error fetching properties: $e');
  }
}



  void setSearchTerm(String term) {
    _searchTerm = term;
    notifyListeners();
  }

  List<Properties> get filteredProperties {
    if (_searchTerm.isEmpty) {
      return _propertiesData.where((property) {
        if (_selectedCategory == 'Precio') {
          // Filtrar por precio
          return property.rentalPrice > _value1 &&
              property.rentalPrice < _value2;
        } else if (_selectedCategory == 'Tipo de Propiedad') {
          // Filtrar por tipo de propiedad
          PropertyType selectedType =
              propertyTypeFromString(_selectedSubCategory);
          return property.propertyType == selectedType;
        } else if (_selectedCategory == 'Tamaño') {
          // Filtrar por tamaño
          Size selectedSize = sizeFromSting(_selectedSubCategory);
          return property.size == selectedSize;
        } else {
          return true;
        }
      }).toList();
    } else {
      return _propertiesData
          .where((property) => property.direccion
              .toLowerCase()
              .contains(_searchTerm.toLowerCase()))
          .toList();
    }
  }

  void updateFilteredProperties(
      String category, String subCategory, int value1, int value2) {
    _selectedCategory = category;
    _selectedSubCategory = subCategory;
    _value1 = value1;
    _value2 = value2;

    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void addSelectedProperty(Properties property, String imageUrl) {
    _selectedProperties.add(property);
    _propertiesImageList.add(imageUrl);
    notifyListeners();
  }

  void removeSelectedProperty(Properties property, String imageUrl) {
    _selectedProperties.remove(property);
    removeimage(imageUrl);
    notifyListeners();
  }

  void removeimage(String imageUrl) {
    _propertiesImageList.remove(imageUrl);
    notifyListeners();
  }
  void addNewProperty(Properties property) {
    _propertiesData.insert(0, property);
    notifyListeners();
  }

  void toggleVisibility() {
    _hideContainer = !_hideContainer;
    notifyListeners();
  }
}
