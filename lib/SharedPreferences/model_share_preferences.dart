import 'package:go_hadiah/Settings/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Constants constants = Constants();

class ModelSharedPreferences {

/*  Future<void> checkLoginStatus(context) async {
    final  currentContext = context;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String keyMasuk = prefs.getString("KEY_MASUK") ?? '';

    if (keyMasuk == 'success') {
      Navigator.of(currentContext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => const NavigasiDrawer()),
            (Route<dynamic> route) => false,
      );
    } else {
      Navigator.of(currentContext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
            (Route<dynamic> route) => false,
      );
    }
  }*/

  Future<Map<String, String>> dataSharedprefrences() async {
    final prefs = await SharedPreferences.getInstance();
    String nomorhp = prefs.getString("NomorHp") ?? '';
    String link = prefs.getString("Link") ?? '';
    String token =  prefs.getString("token") ?? '';

    return {
      'nomorhp': nomorhp,
      'link': link,
      'token': token,

    };
  }
}
