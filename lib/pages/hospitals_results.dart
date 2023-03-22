import 'dart:async';

import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/provider/connection_state.dart';
import 'package:bankblood/provider/loading_state.dart';
import 'package:bankblood/provider/search_type_color.dart';
import 'package:bankblood/provider/volunteer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospitals extends StatelessWidget {
  Hospitals({Key? key}) : super(key: key);
  final AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var connection = Provider.of<ConnectionStatus>(context, listen: false);
    var translation = Translations.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Provider.of<AppColors>(context).white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(translation.result),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.035,
          ),
          Consumer<ChangeButtonColor>(builder: (context, hospitals, _) {
            if (connection.connection != 'ConnectivityResult.none') {
              if (hospitals.loadingState == LoadingState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (hospitals.defaultLength == 0) {
                return Center(
                    child: Text(
                  translation.notFound,
                  style: TextStyle(
                      fontSize: size.width * 0.06, color: _colors.black),
                ));
              } else {
                return SizedBox(
                  height: size.height * 0.85,
                  child: ListView.builder(
                    itemCount: hospitals.hospitalsList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 13.0, left: 13.0, right: 13.0),
                        child: Container(
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                            color: _colors.greys,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            onTap: () {
                              buildAlertDialog(size, context, index);
                            },
                            title: Text(
                                '${translation.hospitalName}: ${hospitals.hospitalsList![index].hospitalName}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.022,
                                ),
                                Text(
                                    '${translation.address}: ${hospitals.hospitalsList![index].hospitalAddress}'),
                                Text(
                                    '${translation.availableBottles}: ${hospitals.hospitalsList![index].availableBottles}'),
                              ],
                            ),
                            trailing: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: size.height * 0.1,
                                  width: size.width * 0.15,
                                  decoration: BoxDecoration(
                                    color: _colors.pink,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                Text(
                                  '${hospitals.hospitalsList![index].bloodType}',
                                  style: TextStyle(fontSize: size.width * 0.06),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            } else {
              return (Center(
                child: Text(
                  translation.noInternet,
                  style: TextStyle(fontSize: 25, color: _colors.orange),
                ),
              ));
            }
          }),
        ],
      ),
    );
  }

  void buildAlertDialog(Size size, BuildContext context, index) {
    var translation = Translations.of(context);
    AlertDialog alert = AlertDialog(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                translation.doYouWantToCall,
              ),
            ),
            Divider(
              thickness: 2.0,
              color: _colors.black,
            )
          ],
        ),
        content: SizedBox(
          height: size.height * 0.3,
          child: Consumer<ChangeButtonColor>(builder: (context, hospitals, _) {
            return Column(
              children: [
                SizedBox(
                    height: size.height * 0.20,
                    width: size.width * 0.9,
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                                '${translation.address}: ${hospitals.hospitalsList![index].hospitalAddress}'),
                          ),
                          Text(
                              '${translation.availableBottles} ${hospitals.hospitalsList![index].availableBottles}'),
                          Text(
                              '${translation.phoneNumber} ${hospitals.hospitalsList![index].hospitalNumber}'),
                          Text(
                            '${hospitals.hospitalsList![index].bloodType}',
                            style: TextStyle(fontSize: size.width * 0.06),
                          ),
                        ],
                      ),

                    ])),
                Row(
                  children: [
                    buildElevatedButton(
                        context, size, _colors.grey, translation.cancel),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: size.width * 0.36,
                          child: buildCallElevatedButton(
                              context, size, _colors.black, translation.call,hospitals.hospitalsList![index].hospitalNumber)),
                    )
                  ],
                )
              ],
            );
          }),
        ));
    showDialog(context: context, builder: (_) => alert);
  }

  ElevatedButton buildElevatedButton(
      BuildContext context, Size size, Color color, String name) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        name,
        style: TextStyle(fontSize: size.width * 0.05),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
      ),
    );
  }
  ElevatedButton buildCallElevatedButton(
      BuildContext context, Size size, Color color, String name,number) {
    final Uri _url = Uri.parse('tel:$number');
    void _launchUrl() async {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }
    return ElevatedButton(
      onPressed: () {
        _launchUrl();
      },
      child: Text(
        name,
        style: TextStyle(fontSize: size.width * 0.05),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
      ),
    );
  }
}
