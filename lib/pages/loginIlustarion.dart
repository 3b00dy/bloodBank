// ignore_for_file: file_names

import 'package:bankblood/i18n/translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class LoginIllustration extends StatelessWidget {
  const LoginIllustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translation=Translations.of(context);
    var size=MediaQuery.of(context).size;
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            translation.help_to_save_millions_by_donating_blood,
            style: TextStyle(
                fontSize: size.width * 0.07,
                color: Provider.of<AppColors>(context).black),
          ),
        ),
        SizedBox(height: size.height * 0.1),
        Image.asset('assets/images/login.jpg'),
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              child: Text(
                translation.pleaseLoginFirst,
                style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              )),
        )
      ],
    );;
  }

}
