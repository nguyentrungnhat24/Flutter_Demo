import 'package:first_project/cubit/login_cubit.dart';
import 'package:first_project/cubit/signup_cubit.dart';
import 'package:first_project/home.dart';
import 'package:first_project/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    //--------------------------------------------------------------------------
    // ----------------------------LƯU Ý TRƯỚC KHI TEST RESPON -----------------
    // ----------------------------test respon lag lắm -------------------------
    // ----------------------------mở cmt NDK ----------------------------------
    // trong /home/levanhuy/flutter/first_project/android/app/build.gradle.kts
    // ----------------------------mở cmt device_preview trong pubspec.yaml-----
    // ----------------------------chạy lại terminal ---------------------------
    // ----------------------------flutter clean -------------------------------
    // ----------------------------flutter pub get -----------------------------
    // -------------------------------------------------------------------------

    // DevicePreview(
    //   enabled: true, // bật tính năng device preview
    //   builder: (context) => const MyApp(),
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: MaterialApp(home: LoginPage()),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPass = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              height: myHeight,
              width: myWidth,
              // constraints: BoxConstraints(
              //   minHeight: MediaQuery.of(context).size.height,
              // ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: myHeight * 0.25,
                    //color: Colors.amber,
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage("assets/images/Rectangle 17.png"),
                          width: myWidth,
                          height: myHeight * 0.25,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Image(
                            image: AssetImage('assets/images/Group.png'),
                            width: myWidth * 0.2,
                            height: myHeight * 0.1,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Log in",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: myWidth * 0.05,
                                  ),
                                ),
                                Text(
                                  "Enter your emails and password",
                                  style: TextStyle(
                                    color: Color(0xFF7C7C7C),
                                    fontSize: myWidth * 0.04,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myHeight * 0.75,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: emailController,
                            onChanged:
                                (val) => context
                                    .read<LoginCubit>()
                                    .emailChanged(val),
                            style: TextStyle(
                              height: 29 / 18,
                              fontSize: myWidth * 0.042,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff181725),
                            ),
                            decoration: InputDecoration(
                              labelText: "Email",
                              errorText: state.emailError,
                              labelStyle: TextStyle(
                                height: 29 / 20,
                                fontSize: myWidth * 0.045,
                                color: Color(0xFF7C7C7C),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                            child: Stack(
                              children: [
                                TextField(
                                  controller: passwordController,
                                  obscureText: !isShowPass,
                                  onChanged:
                                      (val) => context
                                          .read<LoginCubit>()
                                          .passwordChanged(val),
                                  style: TextStyle(
                                    height: 29 / 18,
                                    fontSize: myWidth * 0.042,
                                    color: Color(0xff181725),
                                    fontWeight: FontWeight.w100,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    errorText: state.passwordError,
                                    errorMaxLines: 2,
                                    labelStyle: TextStyle(
                                      height: 29 / 20,
                                      fontSize: myWidth * 0.045,
                                      color: Color(0xFF7C7C7C),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isShowPass = !isShowPass;
                                      });
                                    },
                                    icon: Icon(
                                      !isShowPass
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: myWidth * 0.034,
                                  color: Color(0xff181725),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: SizedBox(
                              height: 67,
                              width: 364,
                              child: ElevatedButton(
                                onPressed:
                                    state.isValid
                                        ? () {
                                          onClickLogIn();
                                        }
                                        : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      state.isValid
                                          ? Color(0xFF53B175)
                                          : Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    fontSize: myWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account? ",
                                  style: TextStyle(
                                    fontSize: myWidth * 0.034,
                                    color: Color(0xff181725),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: onSignUpClick,
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: myWidth * 0.034,
                                      color: Color(0xff53B175),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void onClickLogIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void onSignUpClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                BlocProvider(create: (_) => SignupCubit(), child: SignUp()),
      ),
    );
  }
}
