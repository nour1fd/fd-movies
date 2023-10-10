import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/business/auth/authuser_cubit.dart';
import 'package:movies/model/user/cachhelper.dart';
import 'package:movies/view/auth/loginscreen.dart';
import 'package:movies/view/insideapp/homescreen.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  _SingupScreenState createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen>{
var fullnamecontroller =TextEditingController();
var emailcontroller =TextEditingController();
var phonecontroller =TextEditingController();
var passwordcontroller =TextEditingController();

var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthuserCubit(),
  child: BlocConsumer<AuthuserCubit, AuthuserState>(
  listener: (context, state) {
    if(state is SingupSuccess){
      cachHelper.Savedataa(key: "token", value: state.user.data!.token);

      cachHelper.Savedataa(key: "email", value: state.user.data!.email);
      cachHelper.Savedataa(key: "phone", value: state.user.data!.phone);
      cachHelper.Savedataa(key: "name", value: state.user.data!.name).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:
            (context) => HomeScreen(),));
      });

    }
  },
  builder: (context, state) {
    AuthuserCubit cubit =AuthuserCubit.get(context);

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/fd.png",
                    width: 190,
                    height: 190,
                  ),
                  Align(  alignment: Alignment.topLeft,

                      child: Text("Sing Up",style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 37.0
                      ),)),
                  SizedBox(height: 10,),
                  Align(  alignment: Alignment.topLeft,

                      child: Text("Enter your credentials to continue",style: TextStyle(
                        fontSize: 16,
                      ),)),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                            key: formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) return "can not be empty";
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    print(value);
                                  },
                                   controller: fullnamecontroller,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey
                                        )
                                    ),

                                    label: const Text(
                                      'Full Name'
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) return "can not be empty";
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    print(value);
                                  },
                                   controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey
                                        )
                                    ),
                                    label: const Text(
                                      'Email',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) return "can not be empty";
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    print(value);
                                  },
                                    controller: passwordcontroller,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey
                                        )
                                    ),
                                    label: const Text(
                                      'Password',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) return "can not be empty";
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    print(value);
                                  },
                                   controller: phonecontroller,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey
                                        )
                                    ),
                                    label: const Text(
                                      'Pone Number',
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(onPressed: () {

                    }, child: Text("By continuing you agree to our Terms of service and privacy policy",style: TextStyle(color: Colors.black87,fontSize: 13,fontWeight: FontWeight.w400),)),
                  ),
                  ConditionalBuilder(condition: state is ! SingupLoading,
                      builder: (context) {
                       return Container(color: Colors.deepOrange,
                          width: 250,
                          height: 50,
                          child: TextButton(onPressed: () {

                            if(formkey.currentState!.validate()){
                              cubit.userRegister(email: emailcontroller.text,
                                password: passwordcontroller.text,
                                name: fullnamecontroller.text,
                                phone:phonecontroller.toString(),

                              );

                            }

                          }, child: Text("Sing Up",style:TextStyle(color: Colors.white)),),
                        );

                      },
                      fallback: (context) => CircularProgressIndicator(),),
                  Padding(
                    padding: const EdgeInsets.only(left: 85),
                    child: Row(
                      children: [
                        Text("Already have an account ?",style:TextStyle(color: Colors.black,)),
                        TextButton(onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        }, child: Text("Login",style:TextStyle(color: Colors.deepOrange)),)

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  },
),
);
  }
}
