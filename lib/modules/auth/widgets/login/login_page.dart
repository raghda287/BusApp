import 'dart:convert';

import 'package:easy_bus_app/modules/auth/forgot_password.dart';
import 'package:easy_bus_app/modules/auth/profile.dart';
import 'package:easy_bus_app/modules/auth/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/theme_helper.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Key _formKey = GlobalKey<FormState>();
  Future getLogin() async {
    var url = Uri.parse("https://easybus-api.herokuapp.com/signUp/passenger");
    var respone = await http.post(url,headers: <String,String>
    {
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body:jsonEncode(<String, String>{
      "email":"raghda4@gmail.com",
      "password":"Bushra2020",
          "fName":"raghda",
          "lName":"khairy",
          "phoneNumber":"667898",

    }));
    var responsebody = jsonDecode(respone.body);
    print(responsebody);
    return responsebody;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getLogin(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background (2).png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form

                  child: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'Sign in ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                            ),
                          ),
                          const SizedBox(height: 100.0),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    child: TextField(

                                      decoration: ThemeHelper()
                                          .textInputDecoration('User Name',
                                              'Enter your user name'),
                                    ),
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShaddow(),
                                  ),
                                  const SizedBox(height: 30.0),
                                  Container(
                                    child: TextField(
                                      obscureText: true,
                                      decoration: ThemeHelper()
                                          .textInputDecoration('Password',
                                              'Enter your password'),
                                    ),
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShaddow(),
                                  ),
                                  const SizedBox(height: 15.0),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 0, 10, 20),
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(ForgotPasswordPage());
                                      },
                                      child: const Text(
                                        "Forgot your password?",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: ThemeHelper()
                                        .buttonBoxDecoration(context),
                                    child: ElevatedButton(

                                      style: ThemeHelper().buttonStyle(),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 10, 40, 10),
                                        child: Text(

                                          'Sign In'.toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      onPressed: () {
                                        getLogin();
                                        Get.off(ProfilePage());
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 20),
                                    //child: Text('Don\'t have an account? Create'),
                                    child: Text.rich(TextSpan(children: [
                                      const TextSpan(
                                          text: "Don't have an account? ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      TextSpan(
                                        text: "Create",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(RegistrationPage());
                                          },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                    ])),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
        },
      ),
    );
  }
}
