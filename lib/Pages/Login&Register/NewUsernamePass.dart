import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Login&Register/LoginApps.dart';
import 'package:go_hadiah/Pages/Login&Register/OTPpages.dart';

class NewUsernamePass extends StatefulWidget {
  const NewUsernamePass({super.key});

  @override
  State<NewUsernamePass> createState() => _NewUsernamePassState();
}

class _NewUsernamePassState extends State<NewUsernamePass> {
  /// FOR 'USERNAME'
  final TextEditingController _username = TextEditingController();
  bool isUsernameValidated = false;

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

            /// 'Register' Title Apps
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Column(
                  children: [
                    Text(
                      'Register',
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
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Column(
                  children: [
                    Text(
                      'Buat Username dan Password Baru',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
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

            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // if (_username.text == "" || phonenumber.text == "") {
                        //
                        //   Utils.showAlertDialog(context, constants.pesan_nohpkosong);
                        // }
                        // else {
                        // checkUsername(context, _username.text, phonenumber.text);
                        // }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTPpages()),
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
                        Icons.login,
                        color: Colors.white,
                      ),
                      label: const Text('Daftar',
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
