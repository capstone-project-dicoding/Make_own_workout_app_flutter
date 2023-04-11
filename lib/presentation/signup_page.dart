import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/common/navigation.dart';
import 'package:make_own_workout/data/api/auth_service.dart';
import 'package:make_own_workout/model/user_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Daftar Akun'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/splashx.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Selamat Datang',
                  style: kHeading6,
                ),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        key: const ValueKey('name'),
                        controller: _name,
                        style: kSubtitle,
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{5,}$');
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Minimal 5 karakter';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _name.text = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Nama Lengkap',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _phone,
                        style: kSubtitle,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{10,}$');
                          if (value!.isEmpty) {
                            return 'Nomor handphone tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Minimal 10 karakter';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _phone.text = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Nomor Handphone',
                          hintText: '81234xxxx',
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('+62'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _email,
                        style: kSubtitle,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          setState(() {
                            _email.text = value!;
                          });
                        },
                        validator: (value) {
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
                              .hasMatch(value!)) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _password,
                        style: kSubtitle,
                        obscureText: _obscureText,
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          if (!regExp.hasMatch(value)) {
                            return 'Password tidak valid (Min. 6 karakter)';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _password.text = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.blue,
                  ),
                  child: isLoading
                      ? TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Loading',
                                style: kSubtitle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            await Future.delayed(const Duration(seconds: 5),
                                () {
                              Navigator.pop(context);
                            });
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<AuthService>()
                                  .signUp(
                                    _name.text.trim(),
                                    _phone.text.trim(),
                                    _email.text.trim(),
                                    _password.text.trim(),
                                  )
                                  .then((value) {
                                navigatorKey.currentState!
                                    .popUntil((route) => route.isFirst);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      'Akun berhasil terdaftar',
                                      textAlign: TextAlign.center,
                                      style: kSubtitle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              });
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue,
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          child: Text(
                            'Daftar Akun',
                            style: kSubtitle.copyWith(color: Colors.white),
                          ),
                        ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user = UserModel(
      id: docUser.id,
      name: name,
      phone: phone,
      email: email,
      password: password,
    );

    final json = user.toJson();

    await docUser.set(json);
  }
}
