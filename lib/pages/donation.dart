import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/provider/add_volunteer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

class Donate extends StatelessWidget {
  Donate({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  Map<String, dynamic> volunteerInformation = {
    'volunteerName': '',
    'volunteerAge': '',
    'volunteerAddress': '',
    'volunteerBloodType': '',
    'volunteerPhoneNumber': 0,

  };

  @override
  Widget build(BuildContext context) {

    var snackBar = const SnackBar(
        content: Text('Something went, check your information '));
    var translation=Translations.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Provider.of<AppColors>(context).white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.03,
                ),
                Flexible(
                  child: Text(
                    translation.help_to_save_millions_by_donating_blood,
                    style: TextStyle(fontSize: size.width * 0.07,color: Provider.of<AppColors>(context).black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            buildTextField(translation.fullName, translation.donorName,
                FlutterRemix.account_pin_circle_line, 'volunteerName',context),
            buildTextField(translation.age, translation.donorAge, FlutterRemix.calendar_2_fill,
                'volunteerAge',context),
            buildTextField(translation.address, translation.donorAddress,
                FlutterRemix.user_location_line, 'volunteerAddress',context),
            buildTextField(translation.phoneNumber, translation.donorPhoneNumber,
                FlutterRemix.account_pin_circle_line, 'volunteerPhoneNumber',context),
            buildTextField(translation.donorBloodType, translation.donorBloodType,
                FlutterRemix.hospital_line, 'volunteerBloodType',context),
            SizedBox(
              height: size.height * 0.05,
            ),
            Consumer<AddVolunteerProvider>(builder: (context, vol, _) {
              return ElevatedButton(
                onPressed: () async {

                  await vol.addVolunteer(volunteerInformation);

                  vol.isSigned
                      ? Navigator.pushNamed(context, '/')
                      : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // colorChange.typeSelected && colorChange.placeSelected?
                  // Navigator.pushNamed(context, 'hospitals'):
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  translation.signAsVolunteer,
                  style: TextStyle(fontSize: size.width * 0.06 ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  backgroundColor: MaterialStateProperty.all(colors.orange),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget buildTextField(label, hint, icon, keyName,context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(

        onChanged: (value) {
          volunteerInformation[keyName] = value;
        },
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            hintStyle:TextStyle(
                color: Provider.of<AppColors>(context).hint),

            labelStyle:  TextStyle(
                color: Provider.of<AppColors>(context).black, fontSize: 18, fontWeight: FontWeight.w400),
            prefixIcon: Icon(
              icon,
              color: Provider.of<AppColors>(context).black,
              size: 25,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Provider.of<AppColors>(context).black, width: 1.5),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
