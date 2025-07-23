import 'package:shared_preferences/shared_preferences.dart';
import 'package:zervician/constants/app_strings.dart';
import 'package:zervician/models/user_model.dart';

class AuthService {
  UserModel? user;

  Future<UserModel?> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2)); // simulate loading
    if ((username == 'admin' && password == 'password123')) {
      user = UserModel(name: username, type: 'Admin', email: 'admin@gmail.com');
    }else
    if ((username == 'user' && password == 'user123')) {
      user = UserModel(name: username, type: 'User', email: 'user@gmail.com');
    }else{
      return null;
    }
    saveValueToPrefs(AppStrings.loggedinKey, user!.name!);
    return user;
  }

  void logout() {
    user = null;
    saveValueToPrefs(AppStrings.loggedinKey, '');
  }

  static Future<void> saveValueToPrefs(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Function to load the value from shared preferences
  static Future<String?> loadValueFromPrefs(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedValue = prefs.getString(key);
    return savedValue;
  }

  String? nameValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.usernameCannotBeEmpty;
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return AppStrings.passwordCannotBeEmpty;
    }
    return null;
  }
}
