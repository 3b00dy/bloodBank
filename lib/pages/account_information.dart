
import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/pages/loginIlustarion.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:bankblood/provider/get_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translation=Translations.of(context);
    var size=MediaQuery.of(context).size;
var colors=Provider.of<AppColors>(context);
    return Scaffold(
      backgroundColor: colors.white,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:Text(translation.accountInformation) ,
        actions: [
          Provider.of<Authentication>(context,listen: false).token=='null'?const Text(''):  TextButton.icon(


            label: Text(translation.logout,style:TextStyle(color: Colors.white) ,),
              onPressed: () {
                Provider.of<Authentication>(context, listen: false).logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);

              },
              icon:  Icon(FlutterRemix.logout_circle_line,color: Colors.white,))
        ],
      ),
      body:

      Provider.of<Authentication>(context,listen: false).token=='null'?
          const LoginIllustration()
      :Consumer<GetProfile>(builder: (context, value, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.03),
            child: Column(
              children: [

                buildPersonalListTile(
                    translation.firstName, '${value.first_name}',colors),
                buildPersonalListTile(
                    translation.lastName, '${value.last_name}',colors),
                buildPersonalListTile(
                    translation.emailAddress, '${value.email}',colors),
                buildPersonalListTile(translation.password, '*******',colors),
                buildPersonalListTile(
                    translation.birthDate, value.birthdate!.split(' ')[0],colors),
                buildPersonalListTile(
                    translation.bloodType, '${value.bloodType}',colors),
                buildPersonalListTile(translation.gender, '${value.gender}',colors),
              ],
            ),
          ),
        );
      }),
    );
  }
  Widget buildPersonalListTile(name, info,colors) {
    return Column(
      children: [
        ListTile(
          title: Text(
            name,
            style:  TextStyle(fontWeight: FontWeight.w400,color: colors.black),
          ),
          trailing: Text(
            info,
            style: TextStyle(color: colors.hint),
          ),
        ),
        const Divider(
          thickness: 1.5,
        ),
      ],
    );
  }

}
