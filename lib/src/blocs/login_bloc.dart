import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String? emailError;
  final String? passwordError;
  // thông báo lỗi chung
  final String? generalError;

  LoginFailure({this.emailError, this.passwordError, this.generalError});
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2)); // Giả lập thời gian chờ

    if (_isValidUser(username) && _isValidPass(password)) {
      emit(LoginSuccess());
    } else {
      emit(
        LoginFailure(
          emailError: "Invalid username",
          passwordError: "Invalid password",
          generalError: "Invalid username or password",
        ),
      );
    }
  }

  bool _isValidUser(String username) {
    // Thêm logic kiểm tra định dạng email
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(username);
  }

  bool _isValidPass(String password) {
    // Thêm logic kiểm tra mật khẩu
    return password.length >= 6 &&
        RegExp(r'(?=.*[a-z])').hasMatch(password) &&
        RegExp(r'(?=.*[A-Z])').hasMatch(password) &&
        RegExp(r'(?=.*\d)').hasMatch(password);
  }
}
