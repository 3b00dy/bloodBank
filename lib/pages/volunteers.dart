import 'package:bankblood/colors.dart';
import 'package:bankblood/provider/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Volunteers extends StatelessWidget {
  Volunteers({Key? key}) : super(key: key);
  final AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.025,
          ),
          Consumer<Auth>(builder: (context, hospitals, _) {
            return Container(
              height: size.height * 0.78,
              child: ListView.builder(
                itemCount: hospitals.volList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 13.0, left: 13.0, right: 13.0),
                    child: Container(
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        color: _colors.greys,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          buildAlertDialog(size, context, index);
                        },
                        title: Text(
                            'Name: ${hospitals.volList[index].name}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.022,
                            ),
                            Text(
                                'Address: ${hospitals.volList[index].address}'),
                            Text(
                                'Age : ${hospitals.volList[index].age}'),
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
                              hospitals.volList[index].bloodType,
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
          }),
        ],
      ),
    );
  }

  void buildAlertDialog(Size size, BuildContext context, index) {
    AlertDialog alert = AlertDialog(
        title: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Do you want to call?",
              ),
            ),
            Divider(
              thickness: 2.0,
              color: _colors.black,
            )
          ],
        ),
        content: SizedBox(
          height: size.height*0.2  ,
          child: Consumer<Auth>(builder: (context, hospitals, _) {
            return Column(
              children: [
                SizedBox(
                    height: size.height * 0.1,
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Address: ${hospitals.volList[index].address}'),
                          Text(
                              'Age: ${hospitals.volList[index].age}'),
                          Text(
                              'Phone number: ${hospitals.volList[index].phoneNumber}'),
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
                                  hospitals.volList[index].bloodType,
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
                    buildElevatedButton(context, size, _colors.grey, 'Cancel'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: size.width * 0.36,
                          child: buildElevatedButton(
                              context, size, _colors.black, 'Call')),
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
