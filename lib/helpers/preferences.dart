import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String _email = '';
  static String _nombre = '';
  static String _dni = '';
  static String _password = '';
  static bool _darkmode = false;

  static late SharedPreferences _prefs;

  static Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static String get dni {
    return _prefs.getString('dni') ?? _dni;
  }

  static bool get darkmode {
    return _prefs.getBool('darkmode') ?? _darkmode;
  }

  static String get password {
    return _prefs.getString('password') ?? _password;
  }

  static set email(String value) {
    _email = value;
    _prefs.setString('email', value);
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  static set dni(String value) {
    _dni = value;
    _prefs.setString('dni', value);
  }

  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }

  static set password(String value) {
    _password = value;
    _prefs.setString('password', value);
  }
}
