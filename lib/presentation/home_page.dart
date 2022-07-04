// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colores.dart' as color;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.Colores.homePageBackground,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top:60, left: 20, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "My Own Workout",
                      style: TextStyle(
                      fontSize: 19,
                      color: color.Colores.homePageSubtitle,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Expanded(child: Container()),
                  const SizedBox(width: 10,),
                  Icon(Icons.account_circle_outlined,
                  size: 31,
                  color: color.Colores.homePageicons),
                  const SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_ios_rounded,
                    size: 19,
                    color: color.Colores.homePageicons,)
                ],
              ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Text("Rekomendasi",
                          style: TextStyle(
                          fontSize: 15,
                          color: color.Colores.homePageSubtitle,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:[
                        color.Colores.gradienFirst.withOpacity(0.7),
                        color.Colores.gradienSecomd.withOpacity(0.9),
                      ],
                      begin: Alignment.bottomLeft,
                      end:  Alignment.centerRight
                    ),
                    color:Colors.lightBlueAccent,
                        borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(21),
                        bottomLeft: Radius.circular(21),
                        bottomRight: Radius.circular(21),
                        topRight: Radius.circular(21),
                ),

                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(4, 8),
                        blurRadius: 8,
                        color: color.Colores.gradienSecomd.withOpacity(0.5)
                      )
                    ]

                ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 20, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Workout",
                          style: TextStyle(
                            fontSize: 15,
                            color:color.Colores.homePageContainerSmall
                          ),
                        ),
                        Text(
                          "Practice Workout",
                          style: TextStyle(
                              fontSize: 20,
                              color:color.Colores.homePageContainerSmall
                          ),
                        ),
                        const SizedBox(height: 77,),
                        Row(
                        children: [
                        Icon(Icons.star, size: 20, color:color.Colores.homePageContainerSmall),
                        const SizedBox(width: 9,),
                        Text(
                        "First Practice",
                        style: TextStyle(
                        fontSize: 15,
                        color:color.Colores.homePageContainerSmall),
                      ),
                    ],
                  ),
                ],
              ),
            )
         ),
       ],
      ),
    )
    )
  );
  }
}