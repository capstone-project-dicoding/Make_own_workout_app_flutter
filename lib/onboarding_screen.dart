import 'package:flutter/material.dart';
import 'package:make_own_workout/introduce_screens/intro_page_one.dart';
import 'package:make_own_workout/introduce_screens/intro_page_three.dart';
import 'package:make_own_workout/introduce_screens/intro_page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  //controller to keep track of which page we're on
  // ignore: prefer_final_fields
  PageController _controller = PageController();

  // Keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
            ],
          ),

          // dot indicators
          Container(
            // ignore: prefer_const_constructors
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text('Lewati'),
                ),

                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              // ignore: non_constant_identifier_names
                              builder: (Context) {
                                return const MainPage();
                              },
                            ),
                          );
                        },
                        child: const Text('Mulai'))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Lanjut'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}