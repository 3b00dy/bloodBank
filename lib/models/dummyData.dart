// ignore_for_file: file_names

class Food{
  int carbs;
  int protin;
  int fat ;
  String foodName ;
  String foodDescribe ;
  String date;
  Food(this.carbs,this.protin,this.fat,this.date,this.foodName,this.foodDescribe,);
}

class HospitalsModel{
  String name;
  String address;
  String bloodType;
  String availableBottles;
  int phoneNumber;
  HospitalsModel(this.name,this.address,this.bloodType,this.availableBottles,this.phoneNumber);
}class Volunteer{
  String name;
  String address;
  String bloodType;
  String age;
  int phoneNumber;
  Volunteer(this.name,this.address,this.bloodType,this.age,this.phoneNumber);
}
class AdvicesDaily{
  String img;
  String title;
  String description;
  String url;
  AdvicesDaily({required this.img, required this.description,required this.title,required this.url});
}
