import 'package:easy_bus_app/modules/auth/profile.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../common/theme_helper.dart';



class RegistrationPage extends  StatefulWidget{
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 80,),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [

                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration(
                                    "Mobile Number",
                                    "Enter your mobile number"),
                                keyboardType: TextInputType.phone,
                                validator: (val) {
                                  if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                    return "Enter a valid phone number";
                                  }
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 20.0),

                              Container(
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Password", "Enter your password"),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),

                            const SizedBox(height: 15.0),
                            FormField<bool>(
                              builder: (state) {
                                return Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                          checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            value: checkboxValue,
                                            onChanged: (value) {
                                              setState(() {
                                                checkboxValue = value!;
                                                state.didChange(value);
                                              });
                                            }),
                                        const Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.errorText ?? '',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                      ),
                                    )
                                  ],
                                );
                              },
                              validator: (value) {
                                if (!checkboxValue) {
                                  return 'You need to accept terms and conditions';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Register".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => const ProfilePage()
                                        ),
                                            (Route<dynamic> route) => false
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            const Text("Or create account using social media",  style: TextStyle(color: Colors.grey),),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.googlePlus, size: 35,
                                    color: HexColor("#EC2D2F"),),
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ThemeHelper().alartDialog("Google Plus","You tap on GooglePlus social icon.",context);
                                        },
                                      );
                                    });
                                  },
                                ),
                                const SizedBox(width: 30.0,),
                                GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(width: 5, color: HexColor("#40ABF0")),
                                      color: HexColor("#40ABF0"),
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.twitter, size: 23,
                                      color: HexColor("#FFFFFF"),),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ThemeHelper().alartDialog("Twitter","You tap on Twitter social icon.",context);
                                        },
                                      );
                                    });
                                  },
                                ),
                                const SizedBox(width: 30.0,),
                                GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook, size: 35,
                                    color: HexColor("#4267B2"),),
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ThemeHelper().alartDialog("Facebook",
                                              "You tap on Facebook social icon.",
                                              context);
                                        },
                                      );
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }

}