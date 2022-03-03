import 'package:bankblood/colors.dart';
import 'package:bankblood/i18n/translations.dart';
import 'package:bankblood/provider/connection_state.dart';
import 'package:bankblood/provider/loading_state.dart';
import 'package:bankblood/provider/volunteer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
class Volunteers extends StatelessWidget {
  Volunteers({Key? key}) : super(key: key);
  final AppColors _colors = AppColors();
  @override
  Widget build(BuildContext context) {
    var connection=Provider.of<ConnectionStatus>(context,listen: false);

    var translation = Translations.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Provider.of<AppColors>(context).white,
      body: RefreshIndicator(
        backgroundColor: _colors.orange,
        color: _colors.white,
        strokeWidth: 3.5,
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1), () {
            Provider.of<VolunteerProvider>(context, listen: false)
                .fetchVolunteer();
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.025,
            ),
             Consumer<VolunteerProvider>(builder: (context, volunteer, _) {
               if(connection.connection!='ConnectivityResult.none') {
                if (volunteer.loadingState == LoadingState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: size.height * 0.78,
                    child: ListView.builder(
                      itemCount: volunteer.volList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 13.0, left: 13.0, right: 13.0),
                          child: Container(
                            height: size.height * 0.14,
                            decoration: BoxDecoration(
                              color: Provider.of<AppColors>(context).greys,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              onTap: () {
                                buildAlertDialog(size, context, index);
                              },
                              title: Text(
                                  '${translation.name} ${volunteer.volList![index].volunteerName}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.022,
                                  ),
                                  Text(
                                      '${translation.address} ${volunteer.volList![index].volunteerAddress}'),
                                  Text(
                                      '${translation.age} ${volunteer.volList![index].volunteerAge}'),
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
                                    '${volunteer.volList![index].volunteerBloodType}',
                                    style:
                                        TextStyle(fontSize: size.width * 0.06),
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

              }else {
                 return ( Center(child: Text(translation.noInternet,style: TextStyle(fontSize: 25,color: _colors.orange),),));

               }
            }),
          ],
        ),
      ),
    );
  }

  void buildAlertDialog(Size size, BuildContext context, index) {
    AlertDialog alert = AlertDialog(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Translations.of(context).doYouWantToCall,
              ),
            ),
            Divider(
              thickness: 2.0,
              color: _colors.black,
            )
          ],
        ),
        content: SizedBox(
          height: size.height * 0.25,
          child: Consumer<VolunteerProvider>(builder: (context, hospitals, _) {
            return Column(
              children: [
                SizedBox(
                    height: size.height * 0.14,
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${Translations.of(context).address} ${hospitals.volList![index].volunteerAddress}'),
                          Text(
                              '${Translations.of(context).age}  ${hospitals.volList![index].volunteerAge}'),
                          Text(
                              '${Translations.of(context).phoneNumber}  ${hospitals.volList![index].volunteerPhoneNumber}'),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.13,
                                  decoration: BoxDecoration(
                                    color: _colors.pink,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                Text(
                                  '${hospitals.volList![index].volunteerBloodType}',
                                  style: TextStyle(fontSize: size.width * 0.06),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ])),
                Row(
                  children: [
                    buildElevatedButton(context, size, _colors.grey,
                        Translations.of(context).cancel),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: size.width * 0.36,
                          child: buildElevatedButton(context, size,
                              _colors.black, Translations.of(context).call)),
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
}
