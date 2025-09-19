import 'package:fl_week01/src/blocs/login_bloc.dart';
import 'package:fl_week01/src/resources/home_screen.dart';
import 'package:fl_week01/src/resources/signIn.dart';
import 'package:fl_week01/src/resources/signUp.dart';
import 'package:flutter/material.dart';
import 'package:fl_week01/src/resources/ListView_GridView/listView.dart';
import 'package:fl_week01/src/resources/ListView_GridView/demoCopy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        // có thể thêm các Bloc khác ở đây
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: LoginPage());
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(home: ListViewExampleApp());
//   }
// }
