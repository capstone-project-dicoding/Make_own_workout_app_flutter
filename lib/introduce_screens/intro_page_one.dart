import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child: Column(
        children: [
          Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_sz79nzyi.json'),
        const Text("Latihan dari Rumah", 
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 21,),
        const Text("Latih tubuhmu dari rumah dan ambil kendali dirimu",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
        )
        ],
     ),
     ),
    );
  }
}