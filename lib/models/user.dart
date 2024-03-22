
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phone});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      phone: json['phone']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone
    };
  }
}
