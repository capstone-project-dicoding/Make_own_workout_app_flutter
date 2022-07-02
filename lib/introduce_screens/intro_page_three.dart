import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child: Column(
        children: [
          Lottie.network(
        'https://assets2.lottiefiles.com/packages/lf20_3ueg3po6.json'),
        const Text("Mulai Berlatih", 
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 21,),
        const Text("Mulai berlatih sekarang untuk mendapat manfaat yang baik dan tubuh yang sehat!",
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