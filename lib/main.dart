
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'modules/splash_screen/splash_screen.dart';

void main() {
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  Color _primaryColor = HexColor('#000000');
  Color _accentColor = HexColor('#FFFFFF');


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(

        primaryColor: _primaryColor,
        accentColor: _accentColor,
        primarySwatch: Colors.grey,
      ),
      home: Splash_Screen(),
    );
  }
}

