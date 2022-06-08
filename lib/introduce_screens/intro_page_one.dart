import 'package:flutter/material.dart';

class IntroPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Center(
        child: Image(
          image: AssetImage('assets/splash.png'),
        ),
      ),
      );
  }
}