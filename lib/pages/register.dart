import 'package:bankblood/colors.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);


  AppColors _colors = AppColors();

  late String dropdown;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: _colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,bottom: 8),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: size.width * 0.3,
                  height: size.height * 0.15,
                ),
                Row(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                          fontSize: size.width * 0.1,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * 0.09,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "If you already have an account register",
                      style: TextStyle(fontSize: size.width * 0.05),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "You can ",
                      style: TextStyle(fontSize: size.width * 0.05),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');

                      },
                      child: Text('Login here !',
                          style: TextStyle(
                              fontSize: size.width * 0.05,
                              color: _colors.orange)),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                buildTextField('Full Name', 'Enter your full name',
                    FlutterRemix.account_pin_circle_line),
                buildTextField('Email Address', 'user@example.com',
                    FlutterRemix.mail_line),
                buildTextField('Address', 'Enter your address',
                    FlutterRemix.user_location_line),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: 'Enter Password',
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          FlutterRemix.eye_line,
                          color: Colors.black,
                          size: 25,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    const Icon(FlutterRemix.test_tube_line),
                    Container(
                      height: size.height * 0.07,
                      width: size.width * 0.75,
                      margin: EdgeInsets.all(20),
                      child: Consumer<Authentication>(
                          builder: (context, authProvider, _) {
                        return DropdownButtonHideUnderline(
                          child: GFDropdown(
                            hint: Text(authProvider.hint),
                            padding: const EdgeInsets.all(15),
                            borderRadius: BorderRadius.circular(10),
                            underline: Text('thickness: 5,'),
                            border:
                                const BorderSide(color: Colors.black, width: 1),
                            dropdownButtonColor: _colors.white,
                            value: authProvider.dropdownValue,
                            onChanged: (newValue) {
                              authProvider.setValue(newValue);
                              // setState(() {
                              //   dropdownValue = newValue;
                              // });
                            },
                            items: authProvider.items
                                .map((value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width*0.8,
                  height: size.height*0.05,
                  child: Consumer<Authentication>(builder: (context, colorChange, _) {
                    return ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: size.width * 0.06),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                          backgroundColor:
                              MaterialStateProperty.all(_colors.orange),
                        ));
                  }),
                ),
              ],
            ),
          ),
        ),
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
            // enabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
            //     borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
