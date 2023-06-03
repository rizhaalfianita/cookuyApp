import 'package:shared_preferences/shared_preferences.dart';

Future<String> getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email') ?? '';
}

Future<String> getPassword() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('password') ?? '';
}
