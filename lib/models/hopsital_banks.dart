import 'dart:convert';

List<HospitalBanks> hospitalBanksFromJson(String str) => List<HospitalBanks>.from(json.decode(str).map((x) => HospitalBanks.fromJson(x)));

String hospitalBanksToJson(List<HospitalBanks> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalBanks {
  HospitalBanks({
    this.hospitalName,
    this.hospitalAddress,
    this.bloodType,
    this.availableBottles,
    this.hospitalNumber,
  });

  String? hospitalName;
  String? hospitalAddress;
  String? bloodType;
  int? availableBottles;
  int? hospitalNumber;

  factory HospitalBanks.fromJson(Map<String, dynamic> json) => HospitalBanks(
    hospitalName: json["hospitalName"],
    hospitalAddress: json["hospitalAddress"],
    bloodType: json["bloodType"],
    availableBottles: json["availableBottles"],
    hospitalNumber: json["hospitalNumber"],
  );

  Map<String, dynamic> toJson() => {
    "hospitalName": hospitalName,
    "hospitalAddress": hospitalAddress,
    "bloodType": bloodType,
    "availableBottles": availableBottles,
    "hospitalNumber": hospitalNumber,
  };
}
