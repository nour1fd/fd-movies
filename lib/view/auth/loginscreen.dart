import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/business/auth/authuser_cubit.dart';
import 'package:movies/view/auth/sinupscreen.dart';
import 'package:movies/view/insideapp/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller =TextEditingController();
  var passwordcontroller =TextEditingController();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthuserCubit(),
  child: BlocConsumer<AuthuserCubit, AuthuserState>(
  listener: (context, state) {
if(state is LoginSuccess){
  Navigator.pushReplacement(context, MaterialPageRoute(builder:
      (context) => HomeScreen(),));
}  },
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
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 37.0),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter your emails and password",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Column(
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
                      SizedBox(
                        height: 10,
                      ),
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
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              )
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          label: const Text(
                            'Password',
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.black87),
                    )),
              ),
              ConditionalBuilder(condition: state is! LoginLoading,
                  builder: (context) {
                    return               Container(
                      color: Colors.deepOrange,
                      width: 250,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          if(formkey.currentState!.validate()){
                            cubit.userlogin(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,

                            );

                          }
                        },
                        child: Text("Login", style: TextStyle(color: Colors.white)),
                      ),
                    );

                  },
                  fallback: (context) => CircularProgressIndicator(),),
              Padding(
                padding: const EdgeInsets.only(left: 85),
                child: Row(
                  children: [
                    Text("Don't have an account ?",
                        style: TextStyle(color: Colors.black)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingupScreen(),
                            ));
                      },
                      child: Text("Sing up",
                          style: TextStyle(color: Colors.deepOrange)),
                    )
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
