
import 'dart:io';

import 'package:easy_bus_app/modules/auth/forgot_password.dart';
import 'package:easy_bus_app/modules/auth/widgets/register/register_page.dart';
import 'package:easy_bus_app/modules/auth/widgets/login/cubit.dart';
import 'package:easy_bus_app/modules/auth/widgets/login/states.dart';
import 'package:easy_bus_app/modules/profile/profile.dart';
import 'package:easy_bus_app/shared/components/components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../common/theme_helper.dart';


class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context)  => UserLoginCubit(),
      child: BlocConsumer<UserLoginCubit,UserLoginStates>(

       listener : (context, UserLoginStates) {
          if (UserLoginStates is UserLoginSuccessState)
          {

            if (UserLoginStates.loginModel.status)
            {
              print(UserLoginStates.loginModel.message);

              showToast(text: UserLoginStates.loginModel.message, state: ToastStates.SUCCESS);

Get.offAll(ProfilePage);

            } else {


              showToast(
                text: UserLoginStates.loginModel.message,
                state: ToastStates.WARNING,
              );
            }
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
          body: Stack(
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
                                    controller: emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('User Name',
                                        'Enter your user name'),
                                  ),
                                  decoration: ThemeHelper()
                                      .inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 30.0),
                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  child: TextFormField(

                                    decoration: ThemeHelper().textInputDecoration('Password'),

                                    controller: passwordController,

                                    keyboardType: TextInputType.visiblePassword,


                                    onChanged: (value) {
                                      if (_formKey.currentState!.validate()) {
                                        UserLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );

                                      }
                                    },

                                    validator: ( value) {
                                      if (value!.isEmpty) {
                                        return 'password is too short';
                                      }
                                    },

                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(const ForgotPasswordPage());
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

                                    onPressed:  () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            UserLoginCubit.get(context)
                                                .userLogin(
                                              email: emailController.text,
                                              password: passwordController.text,

                                            );
                                          }
                                        },

                                        child: const Text('login'),
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
                                          Get.to( RegistrationPage());
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

          ),
        );  },

      ),
    );
        }
  }

