// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/presentation/search_page.dart';
import 'package:make_own_workout/provider/mow_provider.dart';
import 'package:make_own_workout/widgets/card_mow.dart';
import 'package:make_own_workout/widgets/platform_widget.dart';
import 'package:provider/provider.dart';
// import 'colores.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String title = 'Make Own Workout';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: primaryColor,
    //   body: SingleChildScrollView(
    //     child: Container(
    //       padding: const EdgeInsets.only(
    //         top: 60,
    //         left: 20,
    //         right: 25,
    //       ),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               const Text(
    //                 "My Own Workout",
    //                 style: TextStyle(
    //                   fontSize: 19,
    //                   color: primaryColor,
    //                   fontWeight: FontWeight.w900,
    //                 ),
    //               ),
    //               Expanded(child: Container()),
    //               const SizedBox(
    //                 width: 10,
    //               ),
    //               const Icon(
    //                 Icons.account_circle_outlined,
    //                 size: 31,
    //                 color: primaryColor,
    //               ),
    //               const SizedBox(
    //                 width: 10,
    //               ),
    //               const Icon(
    //                 Icons.arrow_forward_ios_rounded,
    //                 size: 19,
    //                 color: primaryColor,
    //               )
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           Row(
    //             children: const [
    //               Text(
    //                 "Rekomendasi",
    //                 style: TextStyle(
    //                   fontSize: 15,
    //                   color: primaryColor,
    //                   fontWeight: FontWeight.w900,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Container(
    //             width: MediaQuery.of(context).size.width,
    //             height: 200,
    //             decoration: const BoxDecoration(
    //               gradient: LinearGradient(
    //                 colors: [
    //                   primaryColor,
    //                   primaryColor,
    //                 ],
    //                 begin: Alignment.bottomLeft,
    //                 end: Alignment.centerRight,
    //               ),
    //               color: Colors.lightBlueAccent,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(21),
    //                 bottomLeft: Radius.circular(21),
    //                 bottomRight: Radius.circular(21),
    //                 topRight: Radius.circular(21),
    //               ),
    //               boxShadow: [
    //                 BoxShadow(
    //                   offset: Offset(4, 8),
    //                   blurRadius: 8,
    //                   color: primaryColor,
    //                 )
    //               ],
    //             ),
    //             child: Container(
    //               padding: const EdgeInsets.only(
    //                 left: 20,
    //                 top: 20,
    //                 right: 15,
    //               ),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   const Text(
    //                     "New Workout",
    //                     style: TextStyle(
    //                       fontSize: 15,
    //                       color: primaryColor,
    //                     ),
    //                   ),
    //                   const Text(
    //                     "Practice Workout",
    //                     style: TextStyle(
    //                       fontSize: 20,
    //                       color: primaryColor,
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 77,
    //                   ),
    //                   Row(
    //                     children: const [
    //                       Icon(
    //                         Icons.star,
    //                         size: 20,
    //                         color: primaryColor,
    //                       ),
    //                       SizedBox(
    //                         width: 9,
    //                       ),
    //                       Text(
    //                         "First Practice",
    //                         style: TextStyle(
    //                           fontSize: 15,
    //                           color: primaryColor,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return PlatformWidget(
      androidBuilder: androidBuilder,
      iosBuilder: iosBuilder,
    );
  }

  Widget androidBuilder(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/dum6.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SafeArea(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SearchPage.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search),
                            const SizedBox(width: 10),
                            Text(
                              'Search title',
                              style: kTextTheme.titleMedium!.copyWith(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 80,
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      HomePage.title,
                      style: kTextTheme.titleMedium!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Jaga tubuhmu agar tetap fit',
                      style: kTextTheme.titleMedium!.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _list(context),
          ],
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
