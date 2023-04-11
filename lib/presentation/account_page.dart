import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  static const routeName = '/account';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String? _name, _phone, _email;

  getData() async {
    User? user = FirebaseAuth.instance.currentUser;

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('users').doc(user!.uid).get().then((value) {
      var name = value.data()!['name'].toString();
      var phone = value.data()!['phone'].toString();
      var email = value.data()!['email'].toString();
      _name = name;
      _phone = phone;
      _email = email;
      print('$_name, $_phone, $_email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_rounded),
          )
        ],
        title: Text(
          'Account Page',
          style: kSubtitle.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer(builder: (context, _, child) {
        return FutureBuilder(
          future: getData(),
          builder: (ctx, sn) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person_outline_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ListTile(
                  title: Text(
                    'Email',
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    _email!,
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Nama Lengkap',
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    _name!,
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                ListTile(
                    title: Text(
                      'Nomor Handphone',
                      style: kTextTheme.titleMedium!.copyWith(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      _phone!,
                      style: kTextTheme.titleMedium!.copyWith(
                        fontSize: 15,
                      ),
                    )),
                const SizedBox(height: 15),
              ],
            );
          },
        );
      }),
    );
  }
}
