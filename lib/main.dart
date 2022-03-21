import 'package:flames/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<String> history = [];
    late List<String> flames = [];
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: Wrapper(history: history, flames: flames),
      theme: ThemeData(fontFamily: 'Nunito'),
    );
  }
}
