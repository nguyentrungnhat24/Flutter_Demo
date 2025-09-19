// import 'dart:async';

// import 'package:fl_week01/src/validators/validations.dart';

// class LoginBloc {
//   StreamController _userController = new StreamController();
//   StreamController _passController = new StreamController();

//   Stream get userStream => _userController.stream;
//   Stream get passStream => _passController.stream;

//   bool isValidInfo(String username, String password) {
//     if (!Validations.isValidUser(username)) {
//       _userController.sink.addError("Vui lòng nhập đúng định dạng email");
//       return false;
//     }
//     _userController.sink.add("ok");
//     if (!Validations.isValidPass(password)) {
//       _passController.sink.addError(
//         "Vui lòng nhập mật khẩu có ít nhất 6 kí tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số",
//       );
//       return false;
//     }

//     _passController.sink.add("ok");

//     return true;
//   }

//   void dispose() {
//     _userController.close();
//     _passController.close();
//   }
// }
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2)); // Giả lập thời gian chờ

    if (_isValidUser(username) && _isValidPass(password)) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure("Invalid username or password"));
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
