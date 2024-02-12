import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  /// FOR 'LOGIN'
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool _oldObscurePassword = true;
  bool _newObscurePassword = true;
  bool _confirmObscurePassword = true;
  final _oldPasswordGHKey = GlobalKey(debugLabel: 'oldPasswordGHKey');
  final _newPasswordGHKey = GlobalKey(debugLabel: 'newPasswordGHKey');
  final _confirmPasswordGHKey = GlobalKey(debugLabel: 'confirmPasswordGHKey');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Change Password',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// "Old Password" Text Form Field
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
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
                        key: _oldPasswordGHKey,
                        controller: oldPassword,
                        obscureText: _oldObscurePassword,
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
                            key: _oldPasswordGHKey,
                            icon: Icon(_oldObscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _oldObscurePassword = !_oldObscurePassword;
                                oldPassword.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: oldPassword.text.length));
                              });
                            },
                          ),
                          hintText: 'Password Lama',
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

            /// "New Password" Text Form Field
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                        key: _newPasswordGHKey,
                        controller: newPassword,
                        obscureText: _newObscurePassword,
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
                            key: _newPasswordGHKey,
                            icon: Icon(_newObscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _newObscurePassword = !_newObscurePassword;
                                newPassword.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: newPassword.text.length));
                              });
                            },
                          ),
                          hintText: 'Password Baru',
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

            /// "Konfirmasi Password" Text Form Field
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                        key: _confirmPasswordGHKey,
                        controller: confirmPassword,
                        obscureText: _confirmObscurePassword,
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
                            key: _confirmPasswordGHKey,
                            icon: Icon(_confirmObscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _confirmObscurePassword =
                                    !_confirmObscurePassword;
                                confirmPassword.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: confirmPassword.text.length));
                              });
                            },
                          ),
                          hintText: 'Konfirmasi Password',
                          hintStyle: const TextStyle(color: Colors.black38),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Konfirmasi Password Diperlukan';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// "Change Password" Button
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // if (oldPassword.text == "" ||
                    //     newPassword.text == "" ||
                    //     confirmPassword.text == "") {
                    //   Utils.showAlertDialog(
                    //       context, constants.pesan_changePass);
                    // } else {
                    //   changePass(context, userName, oldPassword.text,
                    //       newPassword.text, confirmPassword.text);
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    'Ubah Password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
