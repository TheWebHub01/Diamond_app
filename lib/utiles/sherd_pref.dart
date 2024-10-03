import 'package:shared_preferences/shared_preferences.dart';

class Shr {
  static SharedPreferences? _prefs;
  Future<Map> readShr() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    String? email = shr.getString("e1");
    String? password = shr.getString("p1");

    Map m1 = {"e1": email, "p1": password};
    return m1;
  }

  static String? getFullName() => _prefs?.getString('fullName');
}
