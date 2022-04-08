import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final AppColors _colors = AppColors();
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> authValues = {
    'email': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    var colors = Provider.of<AppColors>(context);

    Size size = MediaQuery.of(context).size;
    var translation = Translations.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: _colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                        translation.login,
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
                        translation.dontHaveAccount,
                        style: TextStyle(fontSize: size.width * 0.05),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${translation.youCan} ",
                        style: TextStyle(fontSize: size.width * 0.05),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'register');
                        },
                        child: Text(translation.registerHere,
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                color: _colors.orange)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return translation.thisFieldIsRequired;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        authValues['email'] = value;
                      },
                      decoration: InputDecoration(
                          labelText: translation.emailAddress,
                          hintText: translation.emailHint,
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          prefixIcon: const Icon(
                            FlutterRemix.mail_line,
                            color: Colors.black,
                            size: 25,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<Authentication>(
                        builder: (context, obscure, _) {
                      return TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return translation.thisFieldIsRequired;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          authValues['password'] = value;
                        },
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
                              icon: Icon(obscure.isObscure
                                  ? FlutterRemix.eye_close_line
                                  : FlutterRemix.eye_line),
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
                  SizedBox(
                    height: size.height * 0.2,
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
                            colorChange.signIn(
                                authValues['email'], authValues['password']);
                          },
                          child: Text(
                            translation.login,
                            style: TextStyle(fontSize: size.width * 0.06),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
      ),
    );
  }
}
