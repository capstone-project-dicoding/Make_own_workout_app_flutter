import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/provider/mow_provider.dart';
import 'package:make_own_workout/widgets/card_mow.dart';
import 'package:make_own_workout/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  static const String title = 'Favorite';

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
                  FavoritePage.title,
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
        middle: Text('Favorite Page'),
      ),
      child: _list(context),
    );
  }

  Widget _list(BuildContext context) {
    return Consumer<ListMOWProvider>(
      builder: (context, state, _) {
        if (state.resultState == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          );
        } else if (state.resultState == ResultState.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.mowModel.data!.length,
            itemBuilder: (context, index) {
              var mow = state.mowModel.data![index];
              return CardMOW(
                mow: mow,
              );
            },
          );
        } else if (state.resultState == ResultState.noData) {
          return Center(child: Text(state.msg));
        } else if (state.resultState == ResultState.error) {
          return Center(child: Text(state.msg));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
