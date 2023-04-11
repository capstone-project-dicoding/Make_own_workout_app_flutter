import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:make_own_workout/presentation/getstarted_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  static const routeName = '/onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  String title = 'Make Own Workout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text(title)),
      ),
      body: Stack(
        children: [
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
          Container(
            alignment: const Alignment(0, 0.75),
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
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const GetStartedPage();
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

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.network(
            //   'https://assets1.lottiefiles.com/packages/lf20_sz79nzyi.json',
            // ),
            Lottie.asset(
              'assets/intro1.json',
              height: 250,
            ),
            const Text(
              'Latihan dari Rumah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            const Text(
              'Latih tubuhmu dari rumah dan ambil kendali dirimu',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.network(
            //   'https://assets8.lottiefiles.com/private_files/lf30_ke96ns.json',
            // ),
            Lottie.asset(
              'assets/intro2.json',
              height: 200,
            ),
            const Text(
              'Pelajari Setiap Teknik',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            const Text(
              'Pelajari teknik latihan rumahan dengan tips & triknya',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.network(
            //   'https://assets2.lottiefiles.com/packages/lf20_3ueg3po6.json',
            // ),
            Lottie.asset(
              'assets/intro3.json',
              height: 200,
            ),
            const Text(
              'Mulai Berlatih',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Mulai berlatih sekarang untuk mendapat manfaat yang baik dan tubuh yang sehat!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
