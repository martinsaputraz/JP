import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Login&Register/NewPassFP.dart';
import 'package:go_hadiah/Pages/Login&Register/NewUsernamePass.dart';
import 'package:cool_alert/cool_alert.dart';

class AlertDialogVoid {

  static void otpVerified(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your OTP Was Verified',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          content: const Text('Ayo buat Username dan Password baru.'),
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.thumb_up),
              label: const Text('Go'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewUsernamePass()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  static void otpVerifiedFP(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your OTP Was Verified',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          content: const Text('Ayo buat Password baru.'),
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.thumb_up),
              label: const Text('Go'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewPassFP()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  static void otpInvalid(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your OTP Invalid',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          content: const Text('Try to check your OTP again.'),
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.thumb_up),
              label: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void showError(BuildContext context, String message) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.info,
      text: message,
      confirmBtnText: 'OK',
      confirmBtnTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      confirmBtnColor: Colors.red,
      onConfirmBtnTap: () {
        // Dismiss all routes and go back to the root screen
      },
      textTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600),
    );
  }


  void showSuccess(BuildContext context, String message) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: message,
      confirmBtnText: 'OK',
      confirmBtnTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () {

      },
      textTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }


  void showSuccessGiveAway(BuildContext context, String message) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: message, // Set the custom message text
      confirmBtnText: 'OK',
      confirmBtnTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () {
/*        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );*/
      },

      textTextStyle: const TextStyle(
          color: Colors.black, // Set the text color
          fontSize: 18, // Set the text size
          fontWeight: FontWeight.w600 // Set the font weight
      ),
    );
  }

//
}
