import 'dart:convert';

import 'func.dart';
import 'globals.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences? sharedPref;

class SharedPrefKey {
  static const String theme = 'theme';
  static const String introLimit = 'introLimit';

  /// Auth
  static const String phoneNumber = 'phoneNumber';
  static const String password = 'password';
  static const String rememberMe = 'rememberMe';
  static const String biometricAuth = 'biometricAuth';
  static const String sessionToken = 'sessionToken'; // Session token

}

class SharedPref {
  static String getSessionToken() {
    return '';
    // return sharedPref?.getString(SharedPrefKey.sessionToken) ?? '';
  }
}
