import 'dart:convert';

List<Properties> propertiesFromJson(String str) =>
    List<Properties>.from(json.decode(str).map((x) => Properties.fromJson(x)));

String propertiesToJson(List<Properties> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Properties {
  final int id;
  final String nombre;
  final Tamano tamano;
  final String direccion;
  final String cantBanos;
  final int precioAlquiler;
  final String cantHabitaciones;
  final TipoDePropiedad tipoDePropiedad;

  Properties({
    required this.id,
    required this.nombre,
    required this.tamano,
    required this.direccion,
    required this.cantBanos,
    required this.precioAlquiler,
    required this.cantHabitaciones,
    required this.tipoDePropiedad,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["id"],
        nombre: json["nombre"],
        tamano: tamanoValues.map[json["tamano"]]!,
        direccion: json["direccion"],
        cantBanos: json["cant_banos"],
        precioAlquiler: json["precio_alquiler"],
        cantHabitaciones: json["cant_habitaciones"],
        tipoDePropiedad: tipoDePropiedadValues.map[json["tipo_de_propiedad"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "tamano": tamanoValues.reverse[tamano],
        "direccion": direccion,
        "cant_banos": cantBanos,
        "precio_alquiler": precioAlquiler,
        "cant_habitaciones": cantHabitaciones,
        "tipo_de_propiedad": tipoDePropiedadValues.reverse[tipoDePropiedad],
      };
}

enum Tamano { grande, mediano, pequeno }

final tamanoValues = EnumValues({
  "Grande": Tamano.grande,
  "Mediano": Tamano.mediano,
  "Pequeno": Tamano.pequeno
});

enum TipoDePropiedad { casa, edificio, penhouse, planta }

final tipoDePropiedadValues = EnumValues({
  "Casa": TipoDePropiedad.casa,
  "Edificio": TipoDePropiedad.edificio,
  "Penhouse": TipoDePropiedad.penhouse,
  "Planta": TipoDePropiedad.planta
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
  
}


