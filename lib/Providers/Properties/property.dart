import 'package:flutter/material.dart';

class PropertyData extends ChangeNotifier{
  String? typeProperty;
  String? address;
  String? direction;
  String? description;
  double? price;
  String? dimensions;
  int? rooms;
  int? bathrooms;
  double? latitude;
  double? longitude;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setGeneral(String valueTy, String valueAd, String valueDe, double valuePr, String valueDi, int valueRo, int valueBa){
    typeProperty = valueTy;
    address = valueAd;
    description = valueDe;
    price = valuePr;
    dimensions = valueDi;
    rooms = valueRo;
    bathrooms = valueBa;
    notifyListeners();
  }

  void setUbication(double valueLa, double valueLo){
    latitude = valueLa;
    longitude = valueLo;
    notifyListeners();
  }

  void setIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

}