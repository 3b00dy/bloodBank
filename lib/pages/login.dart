import 'package:bankblood/colors.dart';
import 'package:bankblood/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:provider/provider.dart';
class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
final AppColors _colors=AppColors();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: _colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,bottom: 8),
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
                      "Login",
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
                      "If you don't have an account",
                      style: TextStyle(fontSize: size.width * 0.05),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "You can ",
                      style: TextStyle(fontSize: size.width * 0.05),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'register');

                      },
                      child: Text('Register here !',
                          style: TextStyle(
                              fontSize: size.width * 0.05,
                              color: _colors.orange)),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                      labelStyle: const TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                      prefixIcon: const Icon(
                        FlutterRemix.mail_line,
                        color: Colors.black,
                        size: 25,
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                      //     borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: 'Enter Password',
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          FlutterRemix.eye_line,
                          color: Colors.black,
                          size: 25,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
SizedBox(height: size.height*0.2,),
                SizedBox(
                  width: size.width*0.8,
                  height: size.height*0.05,
                  child: Consumer<Authentication>(builder: (context, colorChange, _) {
                    return ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: size.width * 0.06),
                        ),
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          backgroundColor:
                          MaterialStateProperty.all(_colors.orange),
                        ));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
