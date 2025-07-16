import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static final SharedPrefsHelper _instance = SharedPrefsHelper._internal();

  factory SharedPrefsHelper() {
    return _instance;
  }

  SharedPrefsHelper._internal();

  Future<void> saveUserID(num userID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userID.toString());
  }

  Future<int?> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIdString = prefs.getString('user_id');
    return userIdString != null ? int.tryParse(userIdString) : null;
  }

  Future<void> clearUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
  }

  Future<void> saveUserType(String userType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_type', userType.toString());
  }

  Future<String?> getUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userType = prefs.getString('user_type');
    return userType?.toString();
  }
}
