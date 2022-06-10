import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout App'),
      ),
      body: Text("Home"),
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
             print(index);
          },
          padding: EdgeInsets.all(16),
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