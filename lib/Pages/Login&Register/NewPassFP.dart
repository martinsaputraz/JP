import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Login&Register/LoginApps.dart';

class NewPassFP extends StatefulWidget {
  // final String timer;

  const NewPassFP({
    Key? key,
    // required this.timer
  }) : super(key: key);

  @override
  State<NewPassFP> createState() => _NewPassFPState();
}

class _NewPassFPState extends State<NewPassFP> {
  /// FOR 'PASSWORD'
  bool _obscurePassword = true;
  final TextEditingController password = TextEditingController();
  final _passwordKey = GlobalKey(debugLabel: 'passwordKey');
  final _showPasswordKey = GlobalKey(debugLabel: 'showPasswordKey');

  /// FOR 'CONFIRM PASSWORD'
  bool _obscureCPassword = true;
  final TextEditingController confirmpassword = TextEditingController();
  final _cPasswordKey = GlobalKey(debugLabel: 'confirmpasswordKey');
  final _showCPasswordKey = GlobalKey(debugLabel: 'showconfirmPasswordKey');

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
                      'Buat Password Baru',
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

            /// "Password" Text Form Field
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
                          hintText: 'Ketikkan Password',
                          hintStyle: const TextStyle(color: Colors.black38),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password Diperlukan';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// "Confirm Password" Text Form Field
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
                      height: 60.0,
                      child: TextFormField(
                        key: _cPasswordKey,
                        controller: confirmpassword,
                        obscureText: _obscureCPassword,
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
                            key: _showCPasswordKey,
                            icon: Icon(_obscureCPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureCPassword = !_obscureCPassword;
                                password.selection = TextSelection.fromPosition(
                                    TextPosition(offset: password.text.length));
                              });
                            },
                          ),
                          hintText: 'Konfirmasi Password',
                          hintStyle: const TextStyle(color: Colors.black38),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Konfirmasi Password diperlukan!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// "Forgot Password" Button
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ForgotPassword()),
                    // );
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
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    'Ubah Password Baru',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
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
