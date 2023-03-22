import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/main.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:bankblood/provider/language_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translation=Translations.of(context);
    var provider = Provider.of<AppColors>(context);
    return Scaffold(
      backgroundColor: Provider.of<AppColors>(context).white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),

          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  FlutterRemix.moon_clear_line,
                  color: provider.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    translation.darkMode,
                    style: TextStyle(color: provider.black, fontSize: 20),
                  ),
                ),
                const Spacer(),
                Consumer<AppColors>(builder: (context, color, _) {
                  return Switch(
                      value: (color.isDark),
                      onChanged: (value) {
                        color.darkMode(value);
                      });
                }),
              ],
            ),
          ),
          ListTile(
            onTap: (){Navigator.of(context).pushNamed('accountInformation');},
            title: Text(
              translation.accountInformation,
              style: TextStyle(fontSize: 20, color: provider.black),
            ),
            trailing: Icon(

             Provider.of<AppViewModel>(context).appLocale==enLocale? FlutterRemix.arrow_right_line:FlutterRemix.arrow_left_line,
              color: provider.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    translation.language,
                    style: TextStyle(color: provider.black, fontSize: 20),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Provider.of<AppViewModel>(context, listen: false)
                          .switchLanguage();
                    },
                    child: Text(translation.switchLanguage))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
/*Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Row(
              children: [
                Consumer<Authentication>(
                  builder: (context,profile,_) {
                    return Text(
                      '${profile.profile.firstName} ${profile.profile.lastName}',
                      style: TextStyle(color: provider.black, fontSize: 25),
                    );
                  }
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: provider.orange,
                ),
              ],
            ),
          ),
          */