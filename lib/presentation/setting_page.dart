import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/common/navigation.dart';
import 'package:make_own_workout/data/api/auth_service.dart';
import 'package:make_own_workout/presentation/account_page.dart';
import 'package:make_own_workout/presentation/getstarted_page.dart';
import 'package:make_own_workout/provider/preferences_provider.dart';
import 'package:make_own_workout/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const String title = 'Settings';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: androidBuilder,
      iosBuilder: iosBuilder,
    );
  }

  Widget androidBuilder(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerLeft,
                child: Text(
                  SettingPage.title,
                  style: kTextTheme.titleMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _list(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget iosBuilder(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Setting Page'),
      ),
      child: _list(context),
    );
  }

  Widget _list(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, state, child) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Material(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Account'),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AccountPage.routeName);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: state.isDarkTheme ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Dark Theme'),
                    trailing: Switch.adaptive(
                      activeColor:
                          state.isDarkTheme ? Colors.white : Colors.black,
                      value: state.isDarkTheme,
                      onChanged: (value) {
                        state.enableDarkTheme(value);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Sign Out'),
                    trailing: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                        Future.delayed(const Duration(seconds: 5), () {
                          Provider.of<AuthService>(context, listen: false)
                              .signOut()
                              .then((value) => navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst));
                          print('Sign Out');
                          navigatorKey.currentState!
                              .popUntil((route) => route.isFirst);
                          Navigator.pushReplacementNamed(
                              context, GetStartedPage.routeName);
                        });
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        size: 25,
                        color: state.isDarkTheme ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
