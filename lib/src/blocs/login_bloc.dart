import 'dart:async';

import 'package:fl_week01/src/validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("Vui lòng nhập đúng định dạng email");
      return false;
    }
    _userController.sink.add("ok");
    if (!Validations.isValidPass(password)) {
      _passController.sink.addError(
        "Vui lòng nhập mật khẩu có ít nhất 6 kí tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số",
      );
      return false;
    }

    _passController.sink.add("ok");

    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}
