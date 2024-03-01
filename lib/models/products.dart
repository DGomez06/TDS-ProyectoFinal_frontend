// To parse this JSON data, do
//
//     final properties = propertiesFromJson(jsonString);

import 'dart:convert';

List<Properties> propertiesFromJson(String str) =>
    List<Properties>.from(json.decode(str).map((x) => Properties.fromJson(x)));

String propertiesToJson(List<Properties> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Properties {
  final int id;
  final Size size;
  final String nombre;
  final String direccion;
  final int numberRooms;
  final int rentalPrice;
  final PropertyType propertyType;
  final int numberBathrooms;
  //final String imageUrl;

  Properties({
    required this.id,
    required this.size,
    required this.nombre,
    required this.direccion,
    required this.numberRooms,
    required this.rentalPrice,
    required this.propertyType,
    required this.numberBathrooms,
    //this.imageUrl = '',
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["id"],
        size: sizeValues.map[json["Size"]]!,
        nombre: json["Nombre"],
        direccion: json["Direccion"],
        numberRooms: json["NumberRooms"],
        rentalPrice: json["RentalPrice"],
        propertyType: propertyTypeValues.map[json["PropertyType"]]!,
        numberBathrooms: json["NumberBathrooms"],
       // imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Size": sizeValues.reverse[size],
        "Nombre": nombre,
        "Direccion": direccion,
        "NumberRooms": numberRooms,
        "RentalPrice": rentalPrice,
        "PropertyType": propertyTypeValues.reverse[propertyType],
        "NumberBathrooms": numberBathrooms,
      };
}

enum PropertyType { EDIFICIO, PENT_HOUSE, PLANTA }

final propertyTypeValues = EnumValues({
  "Edificio": PropertyType.EDIFICIO,
  "PentHouse": PropertyType.PENT_HOUSE,
  "Planta": PropertyType.PLANTA
});

enum Size { BIG, MEDIUM, SMALL }

final sizeValues =
    EnumValues({"Big": Size.BIG, "Medium": Size.MEDIUM, "Small": Size.SMALL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

PropertyType propertyTypeFromString(String value) {
  return propertyTypeValues.map[value] ?? PropertyType.EDIFICIO;
}

Size sizeFromSting(String value) {
  return sizeValues.map[value] ?? Size.BIG;
}
