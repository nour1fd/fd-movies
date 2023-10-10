import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/const.dart';
import 'package:movies/model/user/usermodel.dart';
import 'package:movies/model/user/userrequest.dart';

part 'authuser_state.dart';

class AuthuserCubit extends Cubit<AuthuserState> {
  AuthuserCubit() : super(AuthuserInitial());
  User ? user;

  static AuthuserCubit get(context) => BlocProvider.of(context);

  void userlogin({
    required String password,
    required String email,
  }) {
    emit(LoginLoading());
    LoginWeb.postData(url: "login", data: {
      "email": email,
      "password": password,
    }).then((value) {
      print("sucesssssssss");
      print('$token');

      user = User.fromJson(value.data);
      print(value.data);
      emit(LoginSuccess(user!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginError(error.toString()));
    });}
    void userRegister({
      required String name,
      required String email,
      required String password,
      required String phone,

    }) {
      emit(SingupLoading());
      LoginWeb.postData(url: "register",
          data: {
            "name": name,
            "email": email,
            "password": password,
            "phone": phone,
          }
      ).then((value) {
        print("sucesssssssss");
        user = User.fromJson(value.data);
        print(value.data);
        emit(SingupSuccess(user!));
      }).catchError((error) {
        print(error.toString());
        emit(LoginError(error.toString()));
      });
    }
  }
