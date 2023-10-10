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

        home:starting
      ),
    );
  }
}

