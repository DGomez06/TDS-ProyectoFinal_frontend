// To parse this JSON data, do
//
//     final favorites = favoritesFromJson(jsonString);

import 'dart:convert';

List<Favorites> favoritesFromJson(String str) => List<Favorites>.from(json.decode(str).map((x) => Favorites.fromJson(x)));

String favoritesToJson(List<Favorites> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favorites {
    final int id;
    final ContentFav property;

    Favorites({
        required this.id,
        required this.property,
    });

    factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        id: json["id"],
        property: ContentFav.fromJson(json["property"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "property": property.toJson(),
    };
}

class ContentFav {
    final int id;
    final String address;
    final String status;
    final String description;
    final int size;
    final int rooms;
    final int bathrooms;
    final double price;
    final String type;
    final double latitude;
    final double longitude;
    final List<ImageFav> images;
    final OwnerFav owner;

    ContentFav({
        required this.id,
        required this.address,
        required this.status,
        required this.description,
        required this.size,
        required this.rooms,
        required this.bathrooms,
        required this.price,
        required this.type,
        required this.latitude,
        required this.longitude,
        required this.images,
        required this.owner,
    });

    factory ContentFav.fromJson(Map<String, dynamic> json) => ContentFav(
        id: json["id"],
        address: json["address"],
        status: json["status"],
        description: json["description"],
        size: json["size"],
        rooms: json["rooms"],
        bathrooms: json["bathrooms"],
        price: json["price"]?.toDouble(),
        type: json["type"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        images: List<ImageFav>.from(json["images"].map((x) => ImageFav.fromJson(x))),
        owner: OwnerFav.fromJson(json["owner"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "status": status,
        "description": description,
        "size": size,
        "rooms": rooms,
        "bathrooms": bathrooms,
        "price": price,
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "owner": owner.toJson(),
    };
}

class ImageFav {
    final int id;
    final String url;

    ImageFav({
        required this.id,
        required this.url,
    });

    factory ImageFav.fromJson(Map<String, dynamic> json) => ImageFav(
        id: json["id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
    };
}

class OwnerFav {
    final int id;
    final String firstName;
    final String lastName;
    final String email;
    final String phone;

    OwnerFav({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
    });

    factory OwnerFav.fromJson(Map<String, dynamic> json) => OwnerFav(
        id: json["Id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
    };
}
