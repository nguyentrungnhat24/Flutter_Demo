import 'package:fl_week01/ProductDetail.dart';
import 'package:fl_week01/signUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userErr = "Vui lòng nhập đúng định dạng email";
  var _passErr =
      "Vui lòng nhập mật khẩu có ít nhất 6 kí tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số";
  bool _userInvalid = false;
  bool _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
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
              "Loging",
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
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                controller: _userController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: _userInvalid ? _userErr : null,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    controller: _passController,
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: _passInvalid ? _passErr : null,
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Icon(
                      _showPass ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ],
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // 👈 màu nền
                    foregroundColor: Colors.black, // 👈 màu chữ (text/icon)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  onPressed: onSignInClicked,
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
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
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if (_userController.text.length < 12 ||
          !_userController.text.contains("@gmail.com")) {
        _userInvalid = true;
      } else
        _userInvalid = false;
      if (!validatePassword(_passController.text)) {
        _passInvalid = true;
      } else
        _passInvalid = false;

      if (!_userInvalid && !_passInvalid) {
        Navigator.push(context, MaterialPageRoute(builder: gotoProductDetail));
      }
    });
  }

  Widget gotoProductDetail(BuildContext context) {
    return ProductDetailPage();
  }

  Widget gotoSignUp(BuildContext context) {
    return SignUpPage();
  }

  bool validatePassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return regex.hasMatch(password);
  }
}
