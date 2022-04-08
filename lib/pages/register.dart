import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:date_field/date_field.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  Map<String, dynamic> authValues = {
    'first_name': '',
    'last_name': '',
    'email': '',
    'password1': '',
    'password2': '',
    'birthdate': '',
    'address': '',
    'gender': '',
    'bloodtype': ''
  };
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var translation = Translations.of(context);
    Size size = MediaQuery.of(context).size;
    var colors = Provider.of<AppColors>(context);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: buildScaffold(colors, size, context),
        ),
      ),
    );
  }

  Scaffold buildScaffold(AppColors colors, Size size, BuildContext context) {
    var translation = Translations.of(context);
    List genderList=[translation.male,translation.female];
    return Scaffold(
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 8),
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
                    translation.register,
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
                    translation.haveAccount,
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${translation.loginHere} ",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: Text('Login here !',
                        style: TextStyle(
                            fontSize: size.width * 0.05, color: colors.orange)),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              buildTextField(translation.firstName, translation.enterFirstName,
                  FlutterRemix.account_pin_circle_line, 'first_name', context),
              buildTextField(translation.lastName, translation.enterLastName,
                  FlutterRemix.account_pin_circle_line, 'last_name', context),
              buildTextField(translation.emailAddress, translation.emailHint,
                  FlutterRemix.mail_line, 'email', context),
              buildTextField(translation.address, translation.enterAddress,
                  FlutterRemix.user_location_line, 'address', context),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  const Icon(FlutterRemix.genderless_line),
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.75,
                    margin: const EdgeInsets.all(20),
                    child: Consumer<Authentication>(
                        builder: (context, authProvider, _) {
                          return DropdownButtonHideUnderline(
                            child: GFDropdown(
                              hint: Text(translation.chooseYourGender),
                              padding: const EdgeInsets.all(15),
                              borderRadius: BorderRadius.circular(10),
                              underline: const Text('thickness: 5,'),
                              border:
                              const BorderSide(color: Colors.black, width: 1),
                              dropdownButtonColor: colors.white,
                              value: authProvider.genderValue,
                              onChanged: (newValue) {
                                authProvider.setGenderValue(newValue);
                                authValues['gender'] = newValue;
                              },
                              items:genderList
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
              Divider(
                indent: 10,
              endIndent: 10,
              thickness: 0.5,
                color: colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimeFormField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: colors.black),
                      errorStyle: TextStyle(color: colors.orange),
                      prefixIcon: Icon(
                        FlutterRemix.calendar_2_line,
                        color: colors.black,
                      ),
                      labelText: translation.birthDate,
                      labelStyle: TextStyle(color: colors.black)),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    value.toIso8601String().split('T')[0];
                    authValues['birthdate'] =
                        value.toIso8601String().split('T')[0];
                    print(value.toIso8601String().split('T')[0]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<Authentication>(builder: (context, obscure, _) {
                  return TextField(
                    onChanged: (value){
                      authValues['password1']=value;
                      authValues['password2']=value;
                    },
                    obscureText: obscure.isObscure,
                    decoration: InputDecoration(
                        labelText: translation.password,
                        hintText: translation.passwordHint,
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        suffixIcon: IconButton(
                          onPressed: () {
                            obscure.eye();
                          },
                          icon: Icon(obscure.isObscure?FlutterRemix.eye_close_line:FlutterRemix.eye_line),
                        ),
                        prefixIcon: Icon(
                          FlutterRemix.key_line,
                          color: colors.black,
                          size: 25,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10))),
                  );
                }),
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
                    margin: const EdgeInsets.all(20),
                    child: Consumer<Authentication>(
                        builder: (context, authProvider, _) {
                      return DropdownButtonHideUnderline(
                        child: GFDropdown(
                          hint: Text(translation.chooseYourBloodType),
                          padding: const EdgeInsets.all(15),
                          borderRadius: BorderRadius.circular(10),
                          underline: const Text('thickness: 5,'),
                          border:
                              const BorderSide(color: Colors.black, width: 1),
                          dropdownButtonColor: colors.white,
                          value: authProvider.dropdownValue,
                          onChanged: (newValue) {
                            authProvider.setValue(newValue);
                            authValues['bloodtype'] = newValue;
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
                width: size.width * 0.8,
                height: size.height * 0.05,
                child: Consumer<Authentication>(
                    builder: (context, colorChange, _) {
                  return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(translation.loading)),
                          );
                        }
                        debugPrint('$authValues');
                      },
                      child: Text(
                        translation.register,
                        style: TextStyle(fontSize: size.width * 0.06),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                        backgroundColor:
                            MaterialStateProperty.all(colors.orange),
                      ));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(label, hint, icon, valueName, context) {
    var colors = Provider.of<AppColors>(context);
    var translation = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return translation.thisFieldIsRequired;
          }
          return null;
        },
        onChanged: (value) {
          authValues[valueName] = value;
        },
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
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

}
