import 'package:flutter/material.dart';
import 'package:ninja_id/pages/Home.dart';
import 'package:ninja_id/pages/chooseLocation.dart';
import 'package:ninja_id/pages/loading.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  }));
}
