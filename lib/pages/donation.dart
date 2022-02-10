import 'package:bankblood/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class Donate extends StatelessWidget {
  Donate({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
                  'Help to save millions by donating blood',
                  style: TextStyle(fontSize: size.width * 0.07),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          buildTextField(
              "Full name", "Donor Name", FlutterRemix.account_pin_circle_line),
          buildTextField(
              "Age ", "Donor Age", FlutterRemix.account_pin_circle_line),
          buildTextField(
              "Address", "Donor Address", FlutterRemix.user_location_line),
          buildTextField(
              "Phone Number", "Donor", FlutterRemix.account_pin_circle_line),
          SizedBox(
            height: size.height * 0.05,
          ),
          ElevatedButton(
            onPressed: () {
              // colorChange.typeSelected && colorChange.placeSelected?
              // Navigator.pushNamed(context, 'hospitals'):
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text(
              'Sign as a volunteer',
              style: TextStyle(fontSize: size.width * 0.06),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStateProperty.all(colors.orange),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(label, hint, icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
              size: 25,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
