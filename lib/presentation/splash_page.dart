import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/main.dart';
import 'package:make_own_workout/presentation/getstarted_page.dart';
import 'package:make_own_workout/presentation/main_page.dart';
import 'package:make_own_workout/presentation/welcome_page.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(
        context,
        initScreen == 0 || initScreen == null
            ? WelcomePage.routeName
            : AuthWrapper.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/splashx.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        child: const Text('Let\'s build and traine your body'),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  static const routeName = '/wrapper';

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String? _id;

  getData() async {
    User? user = FirebaseAuth.instance.currentUser;

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('users').doc(user!.uid).get().then((value) {
      var id = value.data()!['uid'].toString();
      _id = id;
      print('uid : $_id');
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User?>(context);

    // if(user != null){
    //   return const GetStartedPage();
    // }
    // return const MainPage();
    return Consumer(builder: (context, auth, child) {
      return FutureBuilder(
        future: getData(),
        builder: (ctx, sn) {
          if (_id != null) {
            return const MainPage();
          } else {
            return const GetStartedPage();
          }
        },
      );
    });
  }
}
