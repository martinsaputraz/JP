import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Login&Register/LoginApps.dart';
import 'package:go_hadiah/Settings/Utils/AlertDialog.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OTPpages extends StatefulWidget {
  // final String timer;

  const OTPpages({
    Key? key,
    // required this.timer
  }) : super(key: key);

  @override
  State<OTPpages> createState() => _OTPpagesState();
}

class _OTPpagesState extends State<OTPpages> {
  ///FOR 'OTP'
  OtpFieldController otpController = OtpFieldController();
  Timer? _timer;
  OtpTimerButtonController resendOTP = OtpTimerButtonController();
  // int _minutesRemaining = 0; // 5 minutes
  // int _secondsRemaining = 300;

  // ... existing code ...

  // void _startTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if (_secondsRemaining > 0) {
  //         _secondsRemaining--;
  //       } else {
  //         if (_minutesRemaining > 0) {
  //           _minutesRemaining--;
  //           _secondsRemaining = 59;
  //         } else {
  //           // If both minutes and seconds reach 0, cancel the timer
  //           _timer?.cancel();
  //           // Perform any actions you need when the timer reaches 0
  //         }
  //       }
  //     });
  //   });
  // }
  //
  // String _formatTimer(int seconds) {
  //   int minutes = seconds ~/ 60;
  //   int remainingSeconds = seconds % 60;
  //   return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Pastikan untuk membatalkan timer saat widget dihapus
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

            /// TITLE PAGES
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 0, bottom: 0),
                child: const Text(
                  'Input OTP',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ),

            /// SUB TITLE PAGES
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 0, bottom: 5),
                child: const Text(
                  'Check your OTP Codes we sent to you by WhatsApp',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            /// 'OTP' TEXT FORM FIELDS
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OTPTextField(
                        controller: otpController,
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 60,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 30,
                        style: const TextStyle(fontSize: 15),
                        onChanged: (pin) {
                          if (kDebugMode) {
                            print("Changed: $pin");
                          }
                        },
                        onCompleted: (pin) {
                          if (kDebugMode) {
                            print("Completed: $pin");
                          }
                        }),
                  ],
                ),
              ),
            ),

            /// 'Resend OTP' Button
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Column(
                  children: [
                    const Text(
                      "Didn't receive OTP?",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    OtpTimerButton(
                      height: 60,
                      onPressed: () {},
                      text: const Text(
                        'Resend OTP',
                        style: TextStyle(fontSize: 15),
                      ),
                      buttonType: ButtonType.text_button,
                      backgroundColor: Colors.redAccent,
                      duration: 10,
                    ),
                  ],
                ),
              ),
            ),

            /// 'VERIFY OTP' BUTTON
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: ElevatedButton.icon(
                  onPressed: () {
                    AlertDialogVoid.otpVerified(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.pin_outlined,
                      size: 15, color: Colors.white),
                  label: const Text(
                    'VERIFY OTP',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
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
