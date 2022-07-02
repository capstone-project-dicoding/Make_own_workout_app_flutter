import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child: Column(
        children: [
          Lottie.network(
        'https://assets8.lottiefiles.com/private_files/lf30_ke96ns.json'),
        const Text("Pelajari Setiap Teknik", 
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 21,),
        const Text("Pelajari teknik latihan rumahan dengan tips & triknya",
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