import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    ),
  );
}
