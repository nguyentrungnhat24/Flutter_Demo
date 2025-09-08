import 'package:fl_week01/signIn.dart';
import 'package:flutter/material.dart';
import 'package:fl_week01/ListView_GridView/listView.dart';
import 'package:fl_week01/ListView_GridView/demoCopy.dart';

void main() {
  runApp(MyApp());
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
