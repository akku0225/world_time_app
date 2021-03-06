// @dart=2.9
import 'package:flutter/material.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/pages/loading.dart';
import 'package:test_app/pages/choose_location.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
