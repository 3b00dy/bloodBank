// ignore_for_file: must_be_immutable

import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/pages/loginIlustarion.dart';
import 'package:bankblood/provider/add_volunteer.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:bankblood/provider/get_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

class Donate extends StatelessWidget {
  Donate({Key? key}) : super(key: key);
  Map<String, dynamic> volunteerInformation = {
    'volunteerName': '',
    'volunteerAge': '',
    'volunteerAddress': '',
    'volunteerBloodType': '',
    'volunteerPhoneNumber': 0,
  };

  @override
  Widget build(BuildContext context) {
    var colors = Provider.of<AppColors>(context);

    var profile = Provider.of<GetProfile>(context, listen: false);

    int dob = 10;
    // int.parse(profile.birthdate!.split(' ')[0].split('-')[0]);
    int age  = DateTime.now().year - dob;

    var snackBar = const SnackBar(
        content: Text('Something went, check your information '));
    var translation = Translations.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Provider.of<AppColors>(context).white,
      body: SingleChildScrollView(
        child: Provider.of<Authentication>(context, listen: false).token ==
                'null'
            ? const LoginIllustration()
            : Column(
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
                          style: TextStyle(
                              fontSize: size.width * 0.07,
                              color: Provider.of<AppColors>(context).black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  buildInformationContainer(
                      translation.fullName,
                      '${profile.first_name} ${profile.last_name}',
                      FlutterRemix.profile_line,
                      colors),
                  buildInformationContainer(
                      translation.phoneNumber,
                      '${profile.phoneNumber}',
                      FlutterRemix.phone_line,
                      colors),
                  buildInformationContainer(
                      translation.address,
                      '${profile.address}',
                      FlutterRemix.user_location_line,
                      colors),
                  buildInformationContainer(
                      translation.bloodType,
                      '${profile.bloodType}',
                      FlutterRemix.hospital_line,
                      colors),
                  buildInformationContainer(translation.age, '$age',
                      FlutterRemix.calendar_line, colors),
                  Consumer<AddVolunteerProvider>(builder: (context, vol, _) {
                    return ElevatedButton(
                      onPressed: () async {
                        buildAlertDialog(
                            size, context, profile, colors, age, vol, snackBar);
                      },
                      child: Text(
                        translation.signAsDonor,
                        style: TextStyle(fontSize: size.width * 0.06),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                        backgroundColor:
                            MaterialStateProperty.all(colors.orange),
                      ),
                    );
                  })
                ],
              ),
      ),
    );
  }

  Widget buildInformationContainer(
      translation, profile, IconData icon, colors) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: Icon(
            icon,
            color: colors.black,
          ),
          title: Text(
            translation,
            style: TextStyle(color: colors.black, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(profile, style: TextStyle(color: colors.black)),
        ),
      ),
    );
  }

  void buildAlertDialog(
      Size size, BuildContext context, profile, colors, age, vol, snackBar) {
    var translation = Translations.of(context);
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                translation.areYouSure,
              ),
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.black,
            )
          ],
        ),
        content: SizedBox(
          height: size.height * 0.15,
          child: Column(
            children: [
              Text('${translation.areYouSure} ${translation.signAsDonor}'),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildExitElevatedButton(
                      context, size, colors, '     No     '),
                  buildCallElevatedButton(context, size, colors,
                      '     Yes     ', profile, age, vol, snackBar)
                ],
              )
            ],
          ),
        ));
    showDialog(context: context, builder: (_) => alert);
  }

  ElevatedButton buildCallElevatedButton(BuildContext context, Size size, color,
      String name, profile, age, vol, snackBar) {
    return ElevatedButton(
      onPressed: () async {
        volunteerInformation['volunteerName'] =
            '${profile.first_name} ${profile.last_name}';
        volunteerInformation['volunteerAge'] = '$age';
        volunteerInformation['volunteerAddress'] = '${profile.address}';
        volunteerInformation['volunteerBloodType'] = '${profile.bloodType}';
        volunteerInformation['volunteerPhoneNumber'] = '${profile.phoneNumber}';

        await vol.addVolunteer(volunteerInformation);

        vol.isSigned
            ? Navigator.pushNamed(context, '/')
            : ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text(
        name,
        style: TextStyle(fontSize: size.width * 0.05, color: color.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all(
          color.black,
        ),
      ),
    );
  }

  ElevatedButton buildExitElevatedButton(
      BuildContext context, Size size, color, String name) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        name,
        style: TextStyle(fontSize: size.width * 0.05, color: color.black),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all(
          color.grey,
        ),
      ),
    );
  }

  Widget buildTextField(label, hint, icon, keyName, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          volunteerInformation[keyName] = value;
        },
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            hintStyle: TextStyle(color: Provider.of<AppColors>(context).hint),
            labelStyle: TextStyle(
                color: Provider.of<AppColors>(context).black,
                fontSize: 18,
                fontWeight: FontWeight.w400),
            prefixIcon: Icon(
              icon,
              color: Provider.of<AppColors>(context).black,
              size: 25,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Provider.of<AppColors>(context).black, width: 1.5),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
//                        volunteerInformation['volunteerName'] =
//                             '${profile.first_name} ${profile.last_name}';
//                         volunteerInformation['volunteerAge'] = '$age';
//                         volunteerInformation['volunteerAddress'] =
//                             '${profile.address}';
//                         volunteerInformation['volunteerBloodType'] =
//                             '${profile.bloodType}';
//                         volunteerInformation['volunteerPhoneNumber'] =
//                             '${profile.phoneNumber}';
//
//                         await vol.addVolunteer(volunteerInformation);
//
//                         vol.isSigned
//                             ? Navigator.pushNamed(context, '/')
//                             : ScaffoldMessenger.of(context)
//                                 .showSnackBar(snackBar);

// buildTextField(
//
//     translation.fullName,
//     translation.donorName,
//     FlutterRemix.account_pin_circle_line,
//     'volunteerName',
//     context),
// buildTextField(translation.age, translation.donorAge,
//     FlutterRemix.calendar_2_fill, 'volunteerAge', context),
// buildTextField(
//     translation.address,
//     translation.donorAddress,
//     FlutterRemix.user_location_line,
//     'volunteerAddress',
//     context),
// buildTextField(
//     translation.phoneNumber,
//     translation.donorPhoneNumber,
//     FlutterRemix.account_pin_circle_line,
//     'volunteerPhoneNumber',
//     context),
// buildTextField(
//     translation.donorBloodType,
//     translation.donorBloodType,
//     FlutterRemix.hospital_line,
//     'volunteerBloodType',
//     context),
