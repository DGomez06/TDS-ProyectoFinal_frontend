// To parse this JSON data, do
//
//     final properties = propertiesFromJson(jsonString);

import 'dart:convert';

Properties propertiesFromJson(String str) => Properties.fromJson(json.decode(str));

String propertiesToJson(Properties data) => json.encode(data.toJson());

class Properties {
    final int page;
    final int totalPages;
    final List<Content> content;

    Properties({
        required this.page,
        required this.totalPages,
        required this.content,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        page: json["page"],
        totalPages: json["totalPages"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "totalPages": totalPages,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class Content {
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
    final List<ImageFile> images;
    final Owner owner;

    Content({
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

    factory Content.fromJson(Map<String, dynamic> json) => Content(
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
        images: List<ImageFile>.from(json["images"].map((x) => ImageFile.fromJson(x))),
        owner: Owner.fromJson(json["owner"]),
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

class ImageFile {
    final int id;
    final String url;

    ImageFile({
        required this.id,
        required this.url,
    });

    factory ImageFile.fromJson(Map<String, dynamic> json) => ImageFile(
        id: json["id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
    };
}

class Owner {
    final int id;
    final String firstName;
    final String lastName;
    final String email;
    final String phone;

    Owner({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
    });

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
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
