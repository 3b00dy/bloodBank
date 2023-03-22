import 'package:bankblood/main.dart';
import 'package:bankblood/provider/language_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        // width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Consumer<AppViewModel>(builder: (context, appViewModel, _) {
              return buildElevatedButton(appViewModel,arLocale,'اللغة العربية',context);
            }),
            Consumer<AppViewModel>(builder: (context, appViewModel, _) {
              return buildElevatedButton(appViewModel,enLocale,'English Language',context);
            })
          ],
        ),
      ),
    );
  }

  Widget  buildElevatedButton(AppViewModel appViewModel,locale,language,context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        height: MediaQuery.of(context).size.height*0.06,
        child: ElevatedButton(
                onPressed: () {
                  appViewModel.setLanguage(locale);
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                },
                child:  Text(language),
              ),
      ),
    );
  }
}
