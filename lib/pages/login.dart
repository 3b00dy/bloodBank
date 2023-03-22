import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
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
        backgroundColor: colors.white,
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
                        style: TextStyle(fontSize: size.width * 0.05,color: colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${translation.youCan} ",
                        style: TextStyle(fontSize: size.width * 0.05,color: colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'register');
                        },
                        child: Text(translation.registerHere,
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                color: colors.orange)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: colors.black),
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
                          hintStyle: TextStyle(color: colors.black),


                          labelStyle:  TextStyle(
                              color: colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          prefixIcon:  Icon(
                            FlutterRemix.mail_line,
                            color: colors.black,
                            size: 25,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(10)),
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
                        style: TextStyle(color: colors.black),

                        obscureText: obscure.isObscure,
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
                            hintStyle: TextStyle(color: colors.black),

                            labelStyle:  TextStyle(
                                color: colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                            suffixIcon: IconButton(
                              onPressed: () {
                                obscure.eye();
                              },
                              icon: Icon(obscure.isObscure
                                  ? FlutterRemix.eye_close_line
                                  : FlutterRemix.eye_line ,color: colors.black,),
                            ),
                            prefixIcon: Icon(
                              FlutterRemix.key_line,
                              color: colors.black,
                              size: 25,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:           BorderSide(color: colors.black, width: 1.5),
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
                        builder: (context, authAndColorChange, _) {
                      return ElevatedButton(
                          onPressed: () async {
                            debugPrint('$authValues');

                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(translation.loading)),
                              );
                            }

                            await authAndColorChange.signIn(
                                authValues['email'], authValues['password']);

                            authAndColorChange.statusCode == 200
                                ? Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/', (route) => false)
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(translation
                                            .pleaseEnterValidInformation)),
                                  );
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
                                MaterialStateProperty.all(colors.orange),
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
