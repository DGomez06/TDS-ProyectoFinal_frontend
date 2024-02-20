import 'package:flutter/material.dart';
import 'package:lease_managment/models/products.dart';

class ContainerVisibility extends ChangeNotifier {
  bool _hideContainer = false;
  List<Properties> addedProperties = [];
  late String _imageUrl = '';

  bool get hideContainer => _hideContainer;
  String get imageUrl => _imageUrl;


  void setImageUrl(String url) {
    _imageUrl = url;
    notifyListeners(); // Notificar a los oyentes sobre el cambio en el estado.
  }

  void addProperty(Properties property) {
    addedProperties.add(property);
    notifyListeners(); // Notificar a los oyentes sobre el cambio en el estado.
  }

  void toggleVisibility() {
    _hideContainer = !_hideContainer;
    notifyListeners(); // Notificar a los oyentes sobre el cambio en el estado.
  }
}
