// ignore_for_file: must_be_immutable

import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/pages/fade_animation.dart';
import 'package:bankblood/pages/hospitals_results.dart';
import 'package:bankblood/pages/search_by_type.dart';
import 'package:bankblood/provider/search_type_color.dart';
import 'package:bankblood/provider/volunteer_provider.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BasicSearch extends StatelessWidget {
  BasicSearch({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var snackBar = SnackBar(content: Text('Choose Blood and place '));

    var size = MediaQuery.of(context).size;

    var translation = Translations.of(context);
    return Scaffold(
      backgroundColor: Provider.of<AppColors>(context).white,
      body: Column(
        children: [
          buildSizedBoxFoSpaces(size, 0.03, 0),
          Padding(
            padding: EdgeInsets.only(left: 14.0, right: 14.0),
            child: Row(
              children: [
                Text(
                  translation.searchForBankBlood,
                  style: TextStyle(
                      fontSize: size.width * 0.07,
                      color: Provider.of<AppColors>(context).black),
                ),
              ],
            ),
          ),
          buildSizedBoxFoSpaces(size, 0.06, 0),
          Row(
            children: [
              buildSizedBoxFoSpaces(size, 0, 0.04),
              Text(
                translation.choose,
                style: TextStyle(
                    fontSize: size.width * 0.06,
                    color: Provider.of<AppColors>(context).black),
              ),
              buildSizedBoxFoSpaces(size, 0, 0.05),
              Container(
                  decoration: BoxDecoration(
                    color: Provider.of<AppColors>(context).grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: customRadio(context)),
            ],
          ),
          buildSizedBoxFoSpaces(size, 0.08, 0),
          Row(
            children: [
              buildSizedBoxFoSpaces(size, 0, 0.04),
              Text(
                translation.chooseBloodType,
                style: TextStyle(
                    fontSize: size.width * 0.06,
                    color: Provider.of<AppColors>(context).black),
              ),
              buildSizedBoxFoSpaces(size, 0, 0.05),
            ],
          ),
          buildSizedBoxFoSpaces(size, 0.03, 0.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInkWell(size, 'A+', context, translation.aPlus),
              buildInkWell(size, 'B+', context, translation.bPlus),
              buildInkWell(size, 'AB+', context, translation.abPlus),
              buildInkWell(size, 'O+', context, translation.oPlus),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInkWell(size, 'A-', context, translation.aMinus),
              buildInkWell(size, 'B-', context, translation.bMinus),
              buildInkWell(size, 'AB-', context, translation.abMinus),
              buildInkWell(size, 'O-', context, translation.oMinus),
            ],
          ),
          buildSizedBoxFoSpaces(size, 0.08, 0),
          SizedBox(
            width: size.width * 0.7,
            height: size.height * 0.05,
            child:
                Consumer<ChangeButtonColor>(builder: (context, colorChange, _) {
              return ElevatedButton(
                onPressed: () {
                  colorChange.fetchBanks();
                  colorChange.typeSelected && colorChange.placeSelected
                      ? Navigator.of(context).push(MaterialPageRoute(
                          builder: (_context) =>
                              FadeAnimation(0.1, Hospitals())))
                      : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  translation.search,
                  style: TextStyle(fontSize: size.width * 0.06),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(
                      colorChange.typeSelected && colorChange.placeSelected
                          ? Provider.of<AppColors>(context).orange
                          : Provider.of<AppColors>(context).grey),
                ),
              );
            }),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_context) => FadeAnimation(0.1, CompatibleType())));
            },
            child: Text(translation.searchByCompatibleTypes),
          ),
        ],
      ),
    );
  }

  Widget buildInkWell(Size size, String bloodType, context, bloodTypeText) {
    var provider = Provider.of<ChangeButtonColor>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ChangeButtonColor>(builder: (context, provider, _) {
        return InkWell(

          onTap: () {
            provider.selection(bloodType);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: size.height * 0.1,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  color: provider.selected == bloodType? Provider.of<AppColors>(context).orange: Provider.of<AppColors>(context).grey,
                  borderRadius: provider.selected == bloodType? BorderRadius.circular(20):BorderRadius.circular(10),
                ),
              ),
              Text(
                bloodTypeText,
                style: TextStyle(
                    fontSize: size.width * 0.09,
                    color: provider.selected == bloodType
                        ? Provider.of<AppColors>(context).white
                        : Provider.of<AppColors>(context).black),
              ),
            ],
          ),
        );
      }),
    );
  }

  SizedBox buildSizedBoxFoSpaces(Size size, h, w) {
    return SizedBox(
      height: size.height * h,
      width: size.width * w,
    );
  }

  Widget customRadio(ctx) {
    return Consumer<ChangeButtonColor>(
      builder: (context, place,_) {
        return CustomRadioButton(
            enableShape: true,
            margin: const EdgeInsets.only(left: 5, right: 5),
            // padding: 10,
            shapeRadius: 10,
            radius: 8,
            unSelectedBorderColor: Provider.of<AppColors>(ctx).grey,
            selectedBorderColor: Provider.of<AppColors>(ctx).orange,
            elevation: 0,
            absoluteZeroSpacing: true,
            unSelectedColor: Provider.of<AppColors>(ctx).grey,
            buttonLables: [
              Translations.of(ctx).karekh,
              Translations.of(ctx).rassafa,
            ],
            buttonValues: const [
              "Karekh",
              "Rassafa",
            ],
            buttonTextStyle: ButtonTextStyle(
                selectedColor: Provider.of<AppColors>(ctx).white,
                unSelectedColor: Provider.of<AppColors>(ctx).black,
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(ctx).size.width * 0.045,
                )),
            radioButtonValue: (value) {

              debugPrint('value $value');
             place.location = value as String;
              place.place();
            },
            selectedColor: Provider.of<AppColors>(ctx).orange);
      }
    );
  }

  Widget customRadioButton(Size size, String bloodType, context, bloodTypeText) {

    var provider = Provider.of<ChangeButtonColor>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ChangeButtonColor>(builder: (context, provider, _) {
        return InkWell(

          onTap: () {
            provider.selection(bloodType);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: size.height * 0.1,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  color: provider.selected == bloodType? Provider.of<AppColors>(context).orange: Provider.of<AppColors>(context).grey,
                  borderRadius: provider.selected == bloodType? BorderRadius.circular(20):BorderRadius.circular(10),
                ),
              ),
              Text(
                bloodTypeText,
                style: TextStyle(
                    fontSize: size.width * 0.09,
                    color: provider.selected == bloodType
                        ? Provider.of<AppColors>(context).white
                        : Provider.of<AppColors>(context).black),
              ),
            ],
          ),
        );
      }),
    );
  }
}
//5+3
