import 'package:flutter/material.dart';
import 'package:movies/const.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("Your Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)
         , SizedBox(height: 10,),

          Align(alignment:Alignment.topLeft,
                child: Text("Your name : " + name,style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),)),
            SizedBox(height: 10,),
            Align(alignment: Alignment.topLeft,
                child: Text("Your Email : " +email,style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),)),
            SizedBox(height: 10,),
            Align(alignment: Alignment.topLeft,
                child: Text("Your Phone : " +phone,style: TextStyle(
    fontWeight: FontWeight.bold,
    ),)),
            SizedBox(height: 10,),

            Align(alignment:Alignment.topLeft,
              child: Container(color: Colors.lightGreenAccent,
                child: TextButton(onPressed:() {

                },  child: Text("Update",style: TextStyle(color: Colors.black),)),
              ),
            )

          ],
        ),
      ),
    );
  }
}
