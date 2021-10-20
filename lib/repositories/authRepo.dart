import 'package:admin/server/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String,String>> register(Map<String, String> signUpData) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('email', signUpData['email'].toString());
  final Uri url = Uri.parse('$BASE_URL' + 'Account/' + 'Register');
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
  Map<String, String> responeMap = {"state": "", "message": ""};
  var jsonData = jsonDecode(response.body);
  print('body : ' + response.body);
  print('status code : ' + response.statusCode.toString());
  if (response.statusCode == 204) {
    responeMap["state"] = 'Sucess';
    return responeMap;
  } else if (response.statusCode == 400) {
    responeMap["state"] = 'Bad Request';
    responeMap["message"] = jsonData;
    return responeMap;
  } else if (response.statusCode == 403) {
    responeMap["state"] = 'Sucess';
    responeMap["message"] = jsonData;
    return responeMap;
  } else {
    responeMap["state"] = 'Sucess';
    return responeMap;
  }
}

Future<String> verifyEmail(String otpCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var email = _prefs.getString('email');
  print('Email :' + email.toString());
  final Uri url = Uri.parse('$BASE_URL' + 'Account/' + 'ConfirmEmail');
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
    return 'Success';
  else if (response.statusCode == 400)
    return 'Bad Request';
  else if (response.statusCode == 403)
    return 'Not Allowed';
  else
    return 'Server Error';
}

Future<String> login(Map<String, String> loginData) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  final Uri url = Uri.parse('$BASE_URL' + 'Account/' + 'Login');
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
    if (jsonData["emailConfirmed"] == false) {
      print('email not confirmed');
      return 'emailNotConfirmed';
    } else {
      _prefs.setString('token', jsonData['token']);
      print(
          'SharedPreferences token : ' + _prefs.getString('token').toString());
      return 'Success';
    }
  } else if (response.statusCode == 401) {
    return 'Login Failed';
  } else if (response.statusCode == 403) {
    return 'Unauthorized';
  } else {
    return "Server Error Failed";
  }
}

Future<bool> requestResetPass(String email) async {
  final Uri url = Uri.parse('$BASE_URL' + 'Account/' + 'RequestResetPassword');
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
  final Uri url = Uri.parse('$BASE_URL' + 'Account/' + 'ChangePassword');
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

void requestResendEmail() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var email = _prefs.get('email');
  final Uri url =
      Uri.parse('$BASE_URL' + 'Account/' + 'ResendConfirmationEmail');
  print('email is $email url is $url');
  http.Response response = await http.post(
    url,
    body: jsonEncode({email}),
    headers: {
      'Content-Type': 'application/json',
    },
  );
}
