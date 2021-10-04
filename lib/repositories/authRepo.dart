import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositories {
  final String baseUrl =
      'https://sohobuiserver.azurewebsites.net//api/Account/';

  Future<String> register(Map<String, String> signUpData) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('email', signUpData['email'].toString());
    final Uri url = Uri.parse('$baseUrl' + 'Register');

    print(signUpData);
    var jsonSignUpData = json.encode(signUpData);
    print(jsonSignUpData);
    http.Response response = await http.post(
      url,
      body: jsonSignUpData,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('body : ' + response.body);
    print('status code : ' + response.statusCode.toString());
    if (response.statusCode == 204)
      return 'Success';
    else if (response.statusCode == 400)
      return 'Bad Request';
    else
      return 'Server Error';
  }

  Future<bool> verifyEmail(String otpCode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var email = _prefs.getString('email');
    print('Email :' + email.toString());
    final Uri url = Uri.parse('$baseUrl' + 'ConfirmEmail');
    final Map<String, String> verifyEmailData = {
      "email": email.toString(),
      "token": otpCode
    };
    var jsonVerifyEmailData = json.encode(verifyEmailData);
    print('jsonVerifyEmailData :' + jsonVerifyEmailData);
    http.Response response = await http.post(
      url,
      body: jsonVerifyEmailData,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('body : ' + response.body);
    print('status code : ' + response.statusCode.toString());
    if (response.statusCode == 204)
      return true;
    else
      return false;
  }

  Future<String> login(Map<String, String> loginData) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final Uri url = Uri.parse('$baseUrl' + 'Login');
    var jsonLoginData = json.encode(loginData);
    http.Response response = await http.post(
      url,
      body: jsonLoginData,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var jsonData = jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _prefs.setString('token', jsonData['token']);
      print(
          'SharedPreferences token : ' + _prefs.getString('token').toString());
      return jsonData['token'];
    } else {
      return "Login Failed";
    }
  }

  Future<bool> requestResetPass(String email) async {
    final Uri url = Uri.parse('$baseUrl' + 'RequestResetPassword');
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    Map<String, String> emailMap = {"email": email};
    _prefs.setString("email", email);

    var jsonEmail = json.encode(emailMap);

    http.Response response = await http.post(
      url,
      body: jsonEmail,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 204)
      return true;
    else
      return false;
  }

  void changePassword(Map<String, String> passwords) async {
    final Uri url = Uri.parse('$baseUrl' + 'ChangePassword');
    var jsonPasswords = json.encode(passwords);
    http.Response response = await http.post(
      url,
      body: jsonPasswords,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
  }
}
