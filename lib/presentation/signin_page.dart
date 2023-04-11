import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';
import 'package:make_own_workout/common/navigation.dart';
import 'package:make_own_workout/data/api/auth_service.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);
  static const routeName = '/signin';

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool _obscureText = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Masuk Akun'),
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
                        key: const ValueKey('email'),
                        controller: _email,
                        style: kSubtitle,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Email',
                        ),
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
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        key: const ValueKey('password'),
                        controller: _password,
                        style: kSubtitle,
                        obscureText: _obscureText,
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Lupa Password? '),
                  ],
                ),
                const SizedBox(height: 10),
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
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white,
                                  ),
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
                                  .login(
                                    _email.text.trim(),
                                    _password.text.trim(),
                                  )
                                  .then(
                                    (value) => {
                                      navigatorKey.currentState!
                                          .popUntil((route) => route.isFirst)
                                    },
                                  )
                                  .catchError(
                                (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Gagal masuk! Terdapat kesalahan',
                                        textAlign: TextAlign.center,
                                        style: kSubtitle.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
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
                            'Masuk',
                            style: kSubtitle.copyWith(color: Colors.white),
                          ),
                        ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: _email.text.trim(),
    //     password: _password.text.trim(),
    //   );
    // } on FirebaseAuthException catch (e) {
    //   print(e);
    // }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
