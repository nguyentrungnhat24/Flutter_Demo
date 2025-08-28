import 'package:fl_week01/ProductDetail.dart';
import 'package:fl_week01/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

              child: Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                "Enter your credentials to continue",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                // controller: _userController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  // errorText: _userInvalid ? _userErr : null,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                // controller: _userController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  // errorText: _userInvalid ? _userErr : null,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                // controller: _userController,
                decoration: InputDecoration(
                  labelText: "Username",
                  // errorText: _userInvalid ? _userErr : null,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: RichText(
                text: TextSpan(
                  text: "By continuing you agree to our ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                    TextSpan(
                      text: " and",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: " Privacy Policy",
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  onPressed: onSignUpClicked,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 50,
              child: Text.rich(
                TextSpan(
                  text: "Already have an account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: " Sign in",
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
                              builder: (context) => (LoginPage()),
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

  void onSignUpClicked() {
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
