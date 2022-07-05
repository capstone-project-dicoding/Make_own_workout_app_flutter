import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/common/navigation.dart';
import 'package:make_own_workout/model/mow_model.dart';
import 'package:make_own_workout/presentation/detail_page.dart';
import 'package:make_own_workout/provider/db_provider.dart';
import 'package:provider/provider.dart';

class CardMOW extends StatelessWidget {
  final Data mow;
  const CardMOW({Key? key, required this.mow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, state, _) {
        return FutureBuilder<bool>(
          future: state.isFavorited(mow.sId!),
          builder: (context, snapshot) {
            var isFavorited = snapshot.data ?? false;
            return Material(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                leading: Hero(
                  tag: mow.image!,
                  child: Image.network(
                    mow.image!,
                    width: 100,
                  ),
                ),
                trailing: isFavorited
                    ? IconButton(
                        icon: const Icon(Icons.favorite),
                        color: Colors.red,
                        onPressed: () => state.removeMOW(mow.sId!),
                      )
                    : IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        color: Colors.blue,
                        onPressed: () => state.addMOW(mow),
                      ),
                title: Text(mow.name!),
                subtitle: Text(mow.name!),
                onTap: () {
                  Navigation.intentWithData(
                    DetailPage.routeName,
                    mow,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
