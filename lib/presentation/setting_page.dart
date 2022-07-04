import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/provider/preferences_provider.dart';
import 'package:make_own_workout/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const String title = 'Settings';

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
                  title,
                  style: kTextTheme.titleMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
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
          shrinkWrap: true,
          children: [
            Material(
              child: ListTile(
                title: const Text('Dark Theme'),
                trailing: Switch.adaptive(
                  activeColor: state.isDarkTheme ? Colors.white : Colors.black,
                  value: state.isDarkTheme,
                  onChanged: (value) {
                    state.enableDarkTheme(value);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
