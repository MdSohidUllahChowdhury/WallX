import 'package:flutter/material.dart';
import 'package:wallx/wallx.dart';

void main() {
  runApp(MaterialApp(
    home: const Wallx(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
  ));
}
