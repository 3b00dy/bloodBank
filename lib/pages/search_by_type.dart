// ignore_for_file: must_be_immutable

import 'package:bankblood/colors.dart';
import 'package:bankblood/provider/TypeChangeButtonColor.dart';
import 'package:bankblood/provider/search_type_color.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CompatibleType extends StatelessWidget {
  CompatibleType({Key? key}) : super(key: key);
  AppColors colors = AppColors();
  var snackBar = const SnackBar(content: Text('Choose Blood and place '));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor:colors.orange ,
        title: const Text('Compatible Types'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildSizedBoxFoSpaces(size, 0.035, 0),
          Row(
            children: [SizedBox(width: size.width*0.045,),
              Flexible(
                child: Text(
                  'Search for bank blood by compatible types:',
                  style: TextStyle(fontSize: size.width * 0.07),
                ),
              ),
            ],
          ),
          buildSizedBoxFoSpaces(size, 0.06, 0),
          Row(
            children: [
              buildSizedBoxFoSpaces(size, 0, 0.04),
              Text(
                'Choose:',
                style: TextStyle(fontSize: size.width * 0.06),
              ),
              buildSizedBoxFoSpaces(size, 0, 0.05),
              Container(
                  decoration: BoxDecoration(
                    color: colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: customRadio(context)),
            ],
          ),
          buildSizedBoxFoSpaces(size, 0.08, 0),
          buildSizedBoxFoSpaces(size, 0, 0.04),
          Text(
            'Choose your blood type',
            style: TextStyle(fontSize: size.width * 0.06),
          ),
          buildSizedBoxFoSpaces(size, 0, 0.05),
          buildSizedBoxFoSpaces(size, 0.03, 0.0),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInkWell(size, 'A+', context),
              buildInkWell(size, 'B+', context),
              buildInkWell(size, 'AB+', context),
              buildInkWell(size, 'O+', context),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInkWell(size, 'A-', context),
              buildInkWell(size, 'B-', context),
              buildInkWell(size, 'AB-', context),
              buildInkWell(size, 'O-', context),
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

                  colorChange.fetchBanksByType();
                  colorChange.typeSelectedByType && colorChange.placeSelectedByType

                      ? Navigator.pushNamed(context, 'hospitals')
                      : ScaffoldMessenger.of(context).showSnackBar(snackBar);



                },
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: size.width * 0.06),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(
                      colorChange.typeSelectedByType && colorChange.placeSelectedByType
                          ? colors.orange
                          : colors.grey),
                ),
              );
            }),
          ),

        ],
      ),
    );
  }

  Widget buildInkWell(Size size, String bloodType, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ChangeButtonColor>(builder: (context, provider, _) {
        return InkWell(
          onTap: () {
            provider.selectionByType(bloodType);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  color: provider.selectedByType == bloodType
                      ? colors.orange
                      : colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text(
                bloodType,
                style: TextStyle(
                    fontSize: size.width * 0.09,
                    color: provider.selectedByType == bloodType
                        ? colors.white
                        : colors.black),
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
    return CustomRadioButton(
        enableShape: true,
        margin: const EdgeInsets.only(left: 5, right: 5),
        // padding: 10,
        shapeRadius: 10,
        radius: 8,
        unSelectedBorderColor: colors.grey,
        selectedBorderColor: colors.orange,
        elevation: 0,
        absoluteZeroSpacing: false,
        unSelectedColor: colors.grey,
        buttonLables: const [
          'Karekh',
          'Rassafa',
        ],
        buttonValues: const [
          "Karekh",
          "Rassafa",
        ],
        buttonTextStyle: ButtonTextStyle(
            selectedColor: Colors.white,
            unSelectedColor: colors.black,
            textStyle: TextStyle(
              fontSize: MediaQuery.of(ctx).size.width * 0.045,
            )),
        radioButtonValue: (value) {
          Provider.of<ChangeButtonColor>(ctx,listen: false).location= value as String;

          Provider.of<ChangeButtonColor>(ctx,listen: false).placeByType();
        },
        selectedColor: colors.orange);
  }
}
//5+3
