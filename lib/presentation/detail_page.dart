import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/model/mow_model.dart';
import 'package:make_own_workout/provider/db_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Data mow;
  const DetailPage({Key? key, required this.mow}) : super(key: key);
  static const routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.mow.image!,
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.mow.image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.mow.name!,
                        style: kTextTheme.titleMedium!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Consumer<DatabaseProvider>(builder: (context, state, _) {
                        return FutureBuilder<bool>(
                          future: state.isFavorited(widget.mow.sId!),
                          builder: (ctx, sn) {
                            var isFavorited = sn.data ?? false;
                            return isFavorited
                                ? IconButton(
                                    icon: const Icon(Icons.favorite),
                                    color: Colors.red,
                                    onPressed: () {
                                      state.removeMOW(widget.mow.sId!);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            'Delete Favorite Workout',
                                            textAlign: TextAlign.center,
                                            style: kSubtitle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.favorite_border),
                                    color: Colors.blue,
                                    onPressed: () {
                                      state.addMOW(widget.mow);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                            'Favorited Workout',
                                            textAlign: TextAlign.center,
                                            style: kSubtitle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                          },
                        );
                      })
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.favorite,
                      //     color: Colors.red,
                      //   ),
                      // )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Description',
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.mow.description!,
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 13.5,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 25),
      //   height: 50,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {},
      //         child: Text(
      //           'Previous',
      //           style: kTextTheme.titleMedium!.copyWith(
      //             fontSize: 15,
      //           ),
      //         ),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {},
      //         child: Text(
      //           'Next',
      //           style: kTextTheme.titleMedium!.copyWith(
      //             fontSize: 15,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
