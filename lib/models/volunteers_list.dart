// To parse this JSON data, do
//
//     final volunteers = volunteersFromJson(jsonString);

import 'dart:convert';

Volunteers volunteersFromJson(String str) => Volunteers.fromJson(json.decode(str));

String volunteersToJson(Volunteers data) => json.encode(data.toJson());

class Volunteers {
  Volunteers({
    this.volunteerName,
    this.volunteerAge,
    this.volunteerAddress,
    this.volunteerBloodType,
    this.volunteerPhoneNumber,
  });

  String? volunteerName;
  String? volunteerAge;
  String? volunteerAddress;
  String? volunteerBloodType;
  int? volunteerPhoneNumber;

  factory Volunteers.fromJson(Map<String, dynamic> json) => Volunteers(
    volunteerName: json["volunteerName"],
    volunteerAge: json["volunteerAge"],
    volunteerAddress: json["volunteerAddress"],
    volunteerBloodType: json["volunteerBloodType"],
    volunteerPhoneNumber: json["volunteerPhoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "volunteerName": volunteerName,
    "volunteerAge": volunteerAge,
    "volunteerAddress": volunteerAddress,
    "volunteerBloodType": volunteerBloodType,
    "volunteerPhoneNumber": volunteerPhoneNumber,
  };
}
