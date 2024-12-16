import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;
  
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }
  
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }
  
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }
  
  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }
  
  String getThemeData() {
    return _sharedPreferences!.getString('themeData') ?? 'primary';
  }
}