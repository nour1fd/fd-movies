import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/business/movie/viewmovie_cubit.dart';
import 'package:movies/const.dart';
import 'package:movies/model/movie/movierequest.dart';
import 'package:movies/model/user/cachhelper.dart';
import 'package:movies/model/user/userrequest.dart';
import 'package:movies/view/auth/welcomescreen.dart';
import 'package:movies/view/insideapp/homescreen.dart';

Future<void> main() async{
  MovieRequest.init();
  LoginWeb.init();
  token =cachHelper.getData('token');
  if(token ==null)
    runApp( MyApp(WelcomeScreen()));
  else
    runApp( MyApp(HomeScreen()));

}

class MyApp extends StatelessWidget {
Widget starting;
MyApp(this.starting);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewmovieCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:starting
      ),
    );
  }
}

