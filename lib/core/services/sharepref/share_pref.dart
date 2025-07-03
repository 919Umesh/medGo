import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  late SharedPreferences preferences;

  PrefHelper._internal(this.preferences);

  factory PrefHelper(SharedPreferences preferences) {
    return PrefHelper._internal(preferences);
  }

  Future<SharedPreferences> get _initializePrefs async {
    return preferences;
  }

  /// Clears all preferences.
  Future<void> removePreference() async {
    var pref = await _initializePrefs;
    pref.clear();
  }

  Future<void> logOutPref() async {
    var pref = await _initializePrefs;
    await removePreference();
  }

  /// Dark theme preference.
  final String _kIsDarkTheme = "ShowDarkTheme";
  Future<void> setIsDarkTheme(bool value) async {
    var pref = await _initializePrefs;
    pref.setBool(_kIsDarkTheme, value);
  }

  Future<bool> getIsDarkTheme() async {
    var pref = await _initializePrefs;
    return pref.getBool(_kIsDarkTheme) ?? false;
  }

  /// Base URL preference.
  final String _kBaseUrl = "BaseURLAPI";
  Future<void> setBaseUrl(String value) async {
    var pref = await _initializePrefs;
    pref.setString(_kBaseUrl, value);
  }

  /// Login status preference
  final String _kIsLogin = "IsLogin";
  Future<void> setIsLogin(bool value) async {
    var pref = await _initializePrefs;
    pref.setBool(_kIsLogin, value);
  }

  Future<bool> getIsLogin() async {
    var pref = await _initializePrefs;
    return pref.getBool(_kIsLogin) ?? false;
  }

  final String _kUserToken = "UserToken"; // You can change this key as needed

  Future<void> setUserToken(String value) async {
    var pref = await _initializePrefs;
    pref.setString(_kUserToken, value);
  }

  Future<String?> getUserToken() async {
    var pref = await _initializePrefs;
    return pref.getString(_kUserToken);
  }
}
