import 'package:fl_week01/src/blocs/homepage_bloc.dart';
import 'package:fl_week01/src/blocs/login_bloc.dart';
import 'package:fl_week01/src/resources/home_screen.dart';
import 'package:fl_week01/src/resources/signUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  // Biến để theo dõi trạng thái của nút
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    // Dọn dẹp controller khi widget bị hủy
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  // Hàm được gọi mỗi khi text thay đổi
  void _updateButtonState() {
    setState(() {
      // Cập nhật trạng thái dựa trên text của cả 2 controller
      _isButtonEnabled =
          _userController.text.isNotEmpty && _passController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _userController.removeListener(_updateButtonState);
    _passController.removeListener(_updateButtonState);
    // Thêm listener để lắng nghe sự thay đổi
    _userController.addListener(_updateButtonState);
    _passController.addListener(_updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/images/Group.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Enter your emails and password",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.generalError ?? '')),
                      );
                    }
                    if (state is LoginSuccess) {
                      // Nếu login thành công thì điều hướng sang HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => HomepageBloc(),
                            child: const HomePage(),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      children: [
                        // Email
                        TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _userController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            errorText: state is LoginFailure
                                ? state.emailError
                                : null,
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(height: myHeight * 0.03),
                        // Password
                        TextField(
                          controller: _passController,
                          obscureText: !_showPass,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            errorText: state is LoginFailure
                                ? state.passwordError
                                : null,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPass = !_showPass;
                                });
                              },
                              child: Icon(
                                _showPass
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isButtonEnabled
                                  ? Colors.green
                                  : Colors.grey, // 👈 màu nền
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _isButtonEnabled
                                ? () {
                                    final email = _userController.text.trim();
                                    final pass = _passController.text.trim();
                                    context.read<LoginCubit>().login(
                                      email,
                                      pass,
                                    );
                                  }
                                : null,
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 50,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.green, // 👈 màu nền
              //         foregroundColor: Colors.black, // 👈 màu chữ (text/icon)
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(8)),
              //         ),
              //       ),
              //       onPressed: onSignInClicked,
              //       child: Text(
              //         "Log In",
              //         style: TextStyle(color: Colors.white, fontSize: 16),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                height: 60,
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Khi bấm vào "Sign up", nó chạy code ở đây
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  Widget gotoSignUp(BuildContext context) {
    return SignUpPage();
  }

  bool validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return regex.hasMatch(password);
  }
}
