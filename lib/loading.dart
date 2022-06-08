import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffd700),
      child: Center(
        child: SpinKitPumpingHeart(
          color: flamesColors(),
          size: 25.0,
        ),
      ),
    );
  }

  flamesColors() {
    final flamesColors = <Color?>[
      Colors.blue[900],
      Colors.pink[900],
      Colors.purple[900],
      Colors.green[900],
      Colors.red[900],
      Colors.black
    ];

    Random random = Random();
    flamesColors.shuffle();
    final a = random.nextInt(5);
    final e = flamesColors.elementAt(a);
    return (e);
  }
}
