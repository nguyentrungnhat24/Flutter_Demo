import 'package:flutter_bloc/flutter_bloc.dart';

class SignupState {
  final String firstName;
  final String? firstNameError;

  final String lastName;
  final String? lastNameError;

  final String userName;
  final String? userNameError;

  final String email;
  final String? emailError;

  final String password;
  final String? passwordError;

  final bool isValid;

  SignupState({
    this.firstName = '',
    this.firstNameError,
    this.lastName = '',
    this.lastNameError,
    this.userName = '',
    this.userNameError,
    this.email = '',
    this.emailError,
    this.password = '',
    this.passwordError,
    this.isValid = false,
  });

  SignupState copyWith({
    String? firstName,
    String? firstNameError,
    String? lastName,
    String? lastNameError,
    String? userName,
    String? userNameError,
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    bool? isValid,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      firstNameError: firstNameError,

      lastName: lastName ?? this.lastName,
      lastNameError: lastNameError,

      userName: userName ?? this.userName,
      userNameError: userNameError,

      email: email ?? this.email,
      emailError: emailError,

      password: password ?? this.password,
      passwordError: passwordError,

      isValid: isValid ?? this.isValid,
    );
  }
}

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  // Validate First Name
  void firstNameChanged(String value) {
    String? error;
    if (value.isEmpty || value.length < 2) {
      error = "First name ít nhất phải có 2 kí tự";
    }
    emit(
      state.copyWith(
        firstName: value,
        firstNameError: error,
        lastNameError: state.lastNameError,
        userNameError: state.userNameError,
        emailError: state.emailError,
        passwordError: state.passwordError,
        isValid: _validateAll(
          value,
          state.lastName,
          state.userName,
          state.email,
          state.password,
        ),
      ),
    );
  }

  // Validate Last Name
  void lastNameChanged(String value) {
    String? error;
    if (value.isEmpty || value.length < 2) {
      error = "Last name ít nhất phải có 2 kí tự";
    }
    emit(
      state.copyWith(
        lastName: value,
        lastNameError: error,
        firstNameError: state.firstNameError,
        userNameError: state.userNameError,
        emailError: state.emailError,
        passwordError: state.passwordError,
        isValid: _validateAll(
          state.firstName,
          value,
          state.userName,
          state.email,
          state.password,
        ),
      ),
    );
  }

  // Validate User Name
  void userNameChanged(String value) {
    String? error;
    if (value.isEmpty || value.length < 4) {
      error = "Username ít nhất phải có 4 kí tự";
    }
    emit(
      state.copyWith(
        userName: value,
        userNameError: error,
        firstNameError: state.firstNameError,
        lastNameError: state.lastNameError,
        emailError: state.emailError,
        passwordError: state.passwordError,
        isValid: _validateAll(
          state.firstName,
          state.lastName,
          value,
          state.email,
          state.password,
        ),
      ),
    );
  }

  // Validate Email
  void emailChanged(String value) {
    String? error;
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]{2,}@gmail\.com$');
    if (!regex.hasMatch(value)) {
      error = "Vui lòng nhập đúng định dạng email";
    }
    emit(
      state.copyWith(
        email: value,
        emailError: error,
        firstNameError: state.firstNameError,
        lastNameError: state.lastNameError,
        userNameError: state.userNameError,
        passwordError: state.passwordError,
        isValid: _validateAll(
          state.firstName,
          state.lastName,
          state.userName,
          value,
          state.password,
        ),
      ),
    );
  }

  // Validate Password
  void passwordChanged(String value) {
    String? error;
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    if (!regex.hasMatch(value)) {
      error =
          "Vui lòng nhập mật khẩu có ít nhất 6 kí tự," +
          " chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số";
    }
    emit(
      state.copyWith(
        password: value,
        passwordError: error,
        firstNameError: state.firstNameError,
        lastNameError: state.lastNameError,
        userNameError: state.userNameError,
        emailError: state.emailError,
        isValid: _validateAll(
          state.firstName,
          state.lastName,
          state.userName,
          state.email,
          value,
        ),
      ),
    );
  }

  // Check toàn bộ form có hợp lệ không
  bool _validateAll(
    String firstName,
    String lastName,
    String userName,
    String email,
    String password,
  ) {
    final firstNameValid = firstName.isNotEmpty && firstName.length >= 2;
    final lastNameValid = lastName.isNotEmpty && lastName.length >= 2;
    final userNameValid = userName.isNotEmpty && userName.length >= 4;
    final emailValid = RegExp(
      r'^[a-zA-Z0-9._%+-]{2,}@gmail\.com$',
    ).hasMatch(email);
    final passwordValid = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$',
    ).hasMatch(password);

    return firstNameValid &&
        lastNameValid &&
        userNameValid &&
        emailValid &&
        passwordValid;
  }
}
