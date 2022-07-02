import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout App'),
      ),
      body: const Text("Home"),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor:  Colors.white,
          tabBackgroundColor:  Colors.grey.shade700,
          gap: 5,
          onTabChange: (index){
             if (kDebugMode) {
               if (kDebugMode) {
                 print(index);
               }
             }
          },
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(icon: Icons.home,iconColor: Colors.white,
            text: 'Home',
            ),
            GButton(icon: Icons.favorite_border, iconColor: Colors.white,
             text:'Likes',
            ),
            GButton(icon: Icons.settings,iconColor: Colors.white,
             text:'Setting',
            ),
          ],
        ),
      ),
    );
  }
}