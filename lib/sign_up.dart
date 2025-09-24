import 'package:first_project/cubit/signup_cubit.dart';
import 'package:first_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isShowPass = false;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              // constraints: BoxConstraints.expand(),
              // constraints: BoxConstraints(
              //   minHeight: MediaQuery.of(context).size.height,
              // ),
              height: myHeight,
              width: myWidth,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // height: 310,
                    // width: 414.6,
                    height: myHeight * 0.25,
                    child: Stack(
                      children: [
                        // Image.asset('assets/images/Rectangle 17.png'),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        //   child: Align(
                        //     alignment: AlignmentDirectional.center,
                        //     child: Image.asset('assets/images/Group.png'),
                        //   ),
                        // ),
                        Image(
                          image: AssetImage("assets/images/Rectangle 17.png"),
                          width: myWidth,
                          height: myHeight * 0.25,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: myHeight * 0.1),
                            child: Image(
                              image: AssetImage('assets/images/Group.png'),
                              width: myWidth * 0.15,
                              height: myHeight * 0.07,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                                Text(
                                  "Enter your credentials to continue",
                                  style: TextStyle(
                                    color: Color(0xFF7C7C7C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    10,
                                    0,
                                    0,
                                  ),
                                  child: TextField(
                                    controller: firstNameController,
                                    onChanged:
                                        (value) => context
                                            .read<SignupCubit>()
                                            .firstNameChanged(value),
                                    style: TextStyle(
                                      height: 29 / 18,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100,
                                      color: Color(0xff181725),
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "First Name",
                                      errorText: state.firstNameError,
                                      labelStyle: TextStyle(
                                        height: 29 / 20,
                                        fontSize: 20,
                                        color: Color(0xFF7C7C7C),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: lastNameController,
                          onChanged:
                              (value) => context
                                  .read<SignupCubit>()
                                  .lastNameChanged(value),
                          style: TextStyle(
                            height: 29 / 18,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                            color: Color(0xff181725),
                          ),
                          decoration: InputDecoration(
                            labelText: "Last Name",
                            errorText: state.lastNameError,
                            labelStyle: TextStyle(
                              height: 29 / 20,
                              fontSize: 20,
                              color: Color(0xFF7C7C7C),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: TextField(
                            controller: userNameController,
                            onChanged:
                                (value) => context
                                    .read<SignupCubit>()
                                    .userNameChanged(value),
                            style: TextStyle(
                              height: 29 / 18,
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                              color: Color(0xff181725),
                            ),
                            decoration: InputDecoration(
                              labelText: "User Name",
                              errorText: state.userNameError,
                              labelStyle: TextStyle(
                                height: 29 / 20,
                                fontSize: 20,
                                color: Color(0xFF7C7C7C),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: TextField(
                            controller: emailController,
                            onChanged:
                                (value) => context
                                    .read<SignupCubit>()
                                    .emailChanged(value),
                            style: TextStyle(
                              height: 29 / 18,
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                              color: Color(0xff181725),
                            ),
                            decoration: InputDecoration(
                              labelText: "Email",
                              errorText: state.emailError,
                              labelStyle: TextStyle(
                                height: 29 / 20,
                                fontSize: 20,
                                color: Color(0xFF7C7C7C),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Stack(
                            children: [
                              TextField(
                                controller: passwordController,
                                onChanged:
                                    (value) => context
                                        .read<SignupCubit>()
                                        .passwordChanged(value),
                                obscureText: !isShowPass,
                                style: TextStyle(
                                  height: 29 / 18,
                                  fontSize: 18,
                                  color: Color(0xff181725),
                                  fontWeight: FontWeight.w100,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  errorText: state.passwordError,
                                  labelStyle: TextStyle(
                                    height: 29 / 20,
                                    fontSize: 20,
                                    color: Color(0xFF7C7C7C),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Align(
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Text(
                                'By continuing you agree to our ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Terms of Service',
                                  style: TextStyle(
                                    color: Color(0xFF53B175),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                              Text(
                                ' and ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: Color(0xFF53B175),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: SizedBox(
                            height: 67,
                            width: 364,
                            child: ElevatedButton(
                              onPressed:
                                  state.isValid
                                      ? () {
                                        onClickSignUp();
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
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 18,
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
                                  fontSize: 14,
                                  color: Color(0xff181725),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: onClickSignIn,
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 14,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onClickSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void onClickSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
