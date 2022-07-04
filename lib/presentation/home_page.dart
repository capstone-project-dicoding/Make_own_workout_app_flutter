// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
// import 'colores.dart' as color;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 25,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "My Own Workout",
                    style: TextStyle(
                      fontSize: 19,
                      color: primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Expanded(child: Container()),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 31,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 19,
                    color: primaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    "Rekomendasi",
                    style: TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      primaryColor,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21),
                    topRight: Radius.circular(21),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 8),
                      blurRadius: 8,
                      color: primaryColor,
                    )
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "New Workout",
                        style: TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                        ),
                      ),
                      const Text(
                        "Practice Workout",
                        style: TextStyle(
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 77,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "First Practice",
                            style: TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
