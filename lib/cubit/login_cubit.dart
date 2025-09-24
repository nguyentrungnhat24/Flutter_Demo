import 'package:flutter_bloc/flutter_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final bool isValid;

  LoginState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.isValid = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? isValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      isValid: isValid ?? this.isValid,
    );
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void emailChanged(String value) {
    String? error;
    if (!RegExp(r"^[a-zA-Z0-9._%+-]{2,}@gmail\.com$").hasMatch(value)) {
      error = "Vui lòng nhập đúng định dạng email";
    }
    emit(
      state.copyWith(
        email: value,
        emailError: error,
        passwordError: state.passwordError,
        isValid: _validate(value, state.password),
      ),
    );
  }

  void passwordChanged(String value) {
    String? error;
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$').hasMatch(value)) {
      error =
          "Vui lòng nhập mật khẩu có ít nhất 6 kí tự," +
          " chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số";
    }
    emit(
      state.copyWith(
        password: value,
        passwordError: error,
        emailError: state.emailError,
        isValid: _validate(state.email, value),
      ),
    );
  }

  bool _validate(String email, String password) {
    final emailValid = RegExp(
      r"^[a-zA-Z0-9._%+-]{2,}@gmail\.com$",
    ).hasMatch(email);
    final passwordValid = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$',
    ).hasMatch(password);
    return emailValid && passwordValid;
  }
}
