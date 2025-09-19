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
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                    if (state is LoginSuccess) {
                      // Nếu login thành công thì điều hướng sang HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
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
                            errorText: state is LoginFailure ? 'sai' : null,
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
                            errorText: state is LoginFailure
                                ? state.error
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
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              final email = _userController.text.trim();
                              final pass = _passController.text.trim();
                              context.read<LoginCubit>().login(email, pass);
                            },
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
