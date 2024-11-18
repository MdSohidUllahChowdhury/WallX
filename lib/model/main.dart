import 'package:flutter/material.dart';
import 'package:wallx/controller/src/page_control.dart';

void main() {
  runApp(MaterialApp(
    home: const DisplayPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
  ));
}
