import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/HomePages.dart';
import 'package:go_hadiah/Pages/Dashboard.dart';
import 'package:go_hadiah/Pages/Login&Register/ForgotPassword.dart';
import 'package:go_hadiah/Pages/Login&Register/RegisterApps.dart';
import 'package:go_hadiah/Settings/Utils/AlertDialog.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

AlertDialogVoid alertDialogVoid = AlertDialogVoid();
class _LoginPagesState extends State<LoginPages> {
  /// FOR 'LOGIN'
  final TextEditingController _username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _obscurePassword = true;
  final _passwordKey = GlobalKey(debugLabel: 'passwordKey');
  final _showPasswordKey = GlobalKey(debugLabel: 'showPasswordKey');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: true,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03,
                  MediaQuery.of(context).size.height * 0.1,
                  MediaQuery.of(context).size.width * 0.03,
                  MediaQuery.of(context).size.height * 0.01,
                ),
                child: Image.asset(
                  'assets/images/Gift_Logo.jpg',
                  height: 150,
                  width: 150,
                ),
              ),
            ),

            /// 'GO HADIAH' Title Apps
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Column(
                  children: [
                    Text(
                      'GO HADIAH',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 'Login' Title Apps
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// "Username" Text Form Field
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2)),
                        ],
                      ),
                      height: 60,
                      child: TextFormField(
                        controller: _username,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.black87),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: 'Ketik Username',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// "Password" Text Form Field
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2)),
                        ],
                      ),
                      height: 60.0,
                      child: TextFormField(
                        key: _passwordKey,
                        controller: password,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          // labelText: 'Password',
                          // labelStyle: TextStyle(color: Colors.black38),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(15),
                          prefixIcon: const Icon(
                            Icons.password_outlined,
                            // color: Color(0xff7986CB)
                          ),
                          suffixIcon: IconButton(
                            key: _showPasswordKey,
                            icon: Icon(_obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                                password.selection = TextSelection.fromPosition(
                                    TextPosition(offset: password.text.length));
                              });
                            },
                          ),
                          hintText: 'Ketik Password',
                          hintStyle: const TextStyle(color: Colors.black38),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// "Masuk" Button
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // if (_username.text == "" || password.text == "") {
                    //   Utils.showAlertDialog(
                    //       context, constants.pesan_textkosong);
                    // } else {
                    //   signIn(context, _username.text, password.text);
                    // }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPages()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.login, color: Colors.white),
                  label: const Text(
                    'Masuk',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            /// "Forgot Password" Button
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Lupa Password? ',
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Klik Disini',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// "Register" Button
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Belum punya akun? ',
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Daftar Disini',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterApps()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                child: const Column(
                  children: [
                    Text(
                      'Apps powered by WG77\nVersion : v1.0.0',
                      // + constants.versi_apk,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
