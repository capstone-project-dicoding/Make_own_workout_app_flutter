import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:make_own_workout/presentation/favorite_page.dart';
import 'package:make_own_workout/presentation/home_page.dart';
import 'package:make_own_workout/presentation/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    const HomePage(),
    const FavoritePage(),
    const SettingPage(),
  ];

  final List<GButton> _bottomNavBarItems = [
    const GButton(
      icon: Icons.home,
      iconColor: Colors.white,
      text: 'Home',
    ),
    const GButton(
      icon: Icons.favorite,
      iconColor: Colors.white,
      text: 'Favorite',
    ),
    const GButton(
      icon: Icons.settings,
      iconColor: Colors.white,
      text: 'Setting',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: Container(
        color: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: GNav(
          backgroundColor: Colors.blue,
          color: Colors.white,
          activeColor: Colors.blue,
          tabBackgroundColor: Colors.white,
          gap: 5,
          padding: const EdgeInsets.all(8),
          tabs: _bottomNavBarItems,
          onTabChange: _onBottomNavTapped,
        ),
      ),
    );
  }
}
