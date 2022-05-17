import 'package:easy_bus_app/constants/constants.dart';
import 'package:flutter/material.dart';


class Your_Profile extends StatefulWidget {
  const Your_Profile({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Your_Profile>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('PROFILE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'sans-serif-light',
                  color: Colors.black)) ,
        ),
        body:  Container(
          color: Colors.white,
          child:  ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    color: Colors.white,
                    child:  Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Stack(fit: StackFit.loose, children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 140.0,
                                  height: 140.0,
                                  child: const CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage("url"),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 90.0, left: 100.0),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    CircleAvatar(
                                      backgroundColor: klightblue,
                                      radius: 25.0,
                                      child:  Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: const Color(0xffFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() :  Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Expanded(
                                    child: Text(
                                      'First Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Last Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child:  TextField(
                                        decoration: const InputDecoration(
                                            hintText: "Enter First name"),
                                        enabled: !_status,
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Flexible(
                                    child:  TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Last name"),
                                      enabled: !_status,
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Email ',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child:  TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Email "),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child:  TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Mobile Number"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          !_status ? _getActionButtons() :  Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child:  Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child:  Container(
                      child:  RaisedButton(
                        child:  const Text("Save"),
                        textColor: Colors.white,
                        color: Colors.green,
                        onPressed: () {
                          setState(() {
                            _status = true;
                            FocusScope.of(context).requestFocus(FocusNode());
                          });
                        },
                        shape:  RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(20.0)),
                      )),
                ),
                flex: 2,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                      child:  RaisedButton(
                        child:  const Text("Cancel"),
                        textColor: Colors.white,
                        color: klightblue,
                        onPressed: () {
                          setState(() {
                            _status = true;
                            FocusScope.of(context).requestFocus( FocusNode());
                          });
                        },
                        shape:  RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(20.0)),
                      )),
                ),
                flex: 2,
              ),
            ],
          ),
          const SizedBox(height: 5),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {},
            child:  Text('Delet Account',style: TextStyle(color: Colors.red[300]),),
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return  GestureDetector(
      child:  const CircleAvatar(
        backgroundColor: klightblue,
        radius: 14.0,
        child:  Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}