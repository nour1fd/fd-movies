import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/view/auth/loginscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds:5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen())));

    return Scaffold(
      backgroundColor: Colors.amber[800],
      body:
      Column(

        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250,left: 20),
                child: Image.asset("assets/img/fd.png",
                width: 200,
                height: 200,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 270,left: 5),
                child: Column(
                  children: [
                    Text("FD Movie",style: TextStyle(
                        fontFamily: "Amiri-BoldItalic",fontSize: 33
                    ),),
                    Text("online movies",style: TextStyle(
                      fontStyle: FontStyle.normal,fontSize: 12
                    ),),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
