import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Login&Register/LoginApps.dart';
import 'package:go_hadiah/Pages/Login&Register/OtpForgotPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  /// FOR 'USERNAME'
  final TextEditingController _username = TextEditingController();
  bool isUsernameValidated = false;

  /// FOR 'PHONE NUMBER'
  final TextEditingController phonenumber = TextEditingController();
  bool isPhoneNumberValidated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 'GO HADIAH' Title Apps
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: const Column(
                  children: [
                    Text(
                      'GO HADIAH',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 'Forgot Password' Title Apps
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Column(
                  children: [
                    Text(
                      'Forgot Password',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 60,
                      child: TextFormField(
                        controller: _username,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.black87),
                        enabled: !isUsernameValidated,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// "Phone Number" Text Form Field
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
                        controller: phonenumber,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.black87),
                        enabled: !isPhoneNumberValidated,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          prefixIcon: Icon(Icons.contact_phone_outlined),
                          hintText: 'Nomor Handphone',
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Contoh : 08xxxxxxxxxx',
                        style: TextStyle(color: Colors.black45),
                      ),
                    )
                  ],
                ),
              ),
            ),

            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtpForgotPassword()),
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
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      label: const Text('Validasi',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),

            /// "Sudah Punya Akun?" Button
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Sudah punya akun? ',
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'Ayo masuk disini',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPages()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
