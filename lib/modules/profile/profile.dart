
import 'package:easy_bus_app/modules/auth/forgot_password.dart';
import 'package:easy_bus_app/modules/buses_lines_routes/buses_lines.dart';
import 'package:easy_bus_app/modules/profile/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../profile/your_profile.dart';
import '../splash_screen/splash_screen.dart';
import 'widgets/login/login_page.dart';


class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F3F1'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children:[
            Container(
              height: 250,
              child: Stack(
                children:<Widget> [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff113453),
                      borderRadius: BorderRadius.circular(30.0),
                    ),

                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      'Welcome user',
                      style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 23,
                        color: Color(0xffe6e6e6),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60,left: 30),
                    child: Row(
                      children:[

                        const Text(
                          'Use Easy Bus Now',
                          style: TextStyle(
                            fontFamily: 'Century Gothic',
                            fontSize: 15,
                            color: Color(0xffe6e6e6),
                          ),
                          textAlign: TextAlign.center,

                        ),

                        const SizedBox(width: 1.0,),

                        IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right_sharp,color: Colors.white,),),

                      ],

                    ),
                  ),

                  Positioned(
                 bottom: 10,
                      left: 220,
                      child: Image.asset('assets/images/yellowbus.png',)),

                ],
              ),
            ),
            const SizedBox(height: 20.0,),




            Container(
height: 100,
              width: 500,
              decoration: BoxDecoration(
                color: const Color(0xffD96B65),
                borderRadius: BorderRadius.circular(30.0),
              ),


                   child: Row(
                    children:[


                         Expanded(
                           flex:1,
                             child: Image.asset('assets/images/yellowbus.png',)),


               const Expanded(
                 flex: 2,
                 child: Text(

                            'Buses Lines\n& Routes',
                            style: TextStyle(
                              fontFamily: 'Century Gothic',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,

                          ),
               ),





                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const Buses_Lines()),
                        );
                      }, icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),),

                    ],

                  ),



            ),
            const SizedBox(height: 20.0,),

            Container(

              height: 48,
              width: 500,
              decoration: BoxDecoration(
boxShadow: const [
  BoxShadow(
    color: Colors.grey,
    blurRadius: 7,
  ),
],
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child:   Padding(
                padding: const EdgeInsets.all(10.0,),
                child: Row(
                  children:[

                    Expanded(


                         child: InkWell(


                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text( 'Where To ? ',    style: TextStyle(
                                fontFamily: 'Century Gothic',
                                fontSize: 20,
                               color: Color(0xff113453),
                              fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,),
                            ),

                            onTap: () {

                            },

                          ),



                    ),

                    const SizedBox(width: 1.0,),

                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),),

                  ],

                ),
              ),
            ),
            const SizedBox(height: 25.0,),

            Row(
              children: [
                Stack(
                  children: const [
                    Icon(Icons.circle,color: Colors.grey,size: 40,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.star,color: Colors.white,),
                    ),
                  ],
                ),
                const SizedBox(width:20 ,),
                const Text(
                  'Choose a saved place',
                  style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontSize: 18,
                    color: Color(0xff113453),
                  ),
                  softWrap: false,
                ),
                const SizedBox(width: 40,),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,color: HexColor('113453'),),),
              ],
            ),

          ],


        ),
      ),







      appBar: AppBar(
        leadingWidth: 100.0,
        backgroundColor: HexColor('#F5F3F1'),
        elevation: 0.0,
      ),

      drawer: Drawer(

          child: ListView(
            children: [
              DrawerHeader(

                decoration: BoxDecoration(
                  color: HexColor('#3F647F'),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: (){ Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Your_Profile()),
                    );
                      },
                    child: const Text("view profile",

                      style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),

                    ),
                  ),

                ),
              ),
              ListTile(
                leading: Icon(Icons.screen_lock_landscape_rounded,  color: Theme.of(context).primaryColor,),
                title: Text('Your Trips', style: TextStyle(fontSize: 17, color: Theme.of(context).primaryColor),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Splash_Screen()));
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),

              ListTile(
                leading: Icon(Icons.payment,color: Theme.of(context).primaryColor),
                title: Text('Payment', style: TextStyle( color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.settings,color: Theme.of(context).primaryColor),
                title: Text('Setting',style: TextStyle(color: Theme.of(context).primaryColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.help,color: Theme.of(context).primaryColor,),
                title: Text('Help',style: TextStyle(color: Theme.of(context).primaryColor),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, color: Theme.of(context).primaryColor,),
                title: Text('Logout',style: TextStyle(color: Theme.of(context).primaryColor),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),


    );

  }

}