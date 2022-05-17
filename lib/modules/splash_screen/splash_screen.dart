
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login_page.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);


  @override
  State<Splash_Screen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,
        duration: const Duration(milliseconds: 400));
    fadingAnimation=Tween<double>(begin: .2,end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);

    goToNextView();
  }
  @override
  void dispose(){
    animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
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
          FadeTransition(
            opacity: fadingAnimation!,
            child: Center(
              child: Container(

                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bus.png'),
                  ),
                ),

              ),


            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210.0,),


            child: Center(
              child: Container(
                width: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/loading.png'),
                  ),
                ),

              ),
            ),


          ),




        ],
      ),
    );

  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 2),(){
      Get.to(()=>const LoginPage(),transition: Transition.fade);
    });
  }
}
