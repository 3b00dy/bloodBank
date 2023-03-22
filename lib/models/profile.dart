// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.bloodType,
    this.birthdate,
    this.gender,
    this.phoneNumber,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? bloodType;
  DateTime? birthdate;
  String? gender;
  int? phoneNumber;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    address: json["address"],
    bloodType: json["bloodType"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "address": address,
    "bloodType": bloodType,
    "birthdate": "${birthdate!.year.toString().padLeft(4, '0')}-${birthdate!.month.toString().padLeft(2, '0')}-${birthdate!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "phoneNumber": phoneNumber,
  };
}
