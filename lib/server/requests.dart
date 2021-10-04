import 'dart:convert';
import 'package:admin/server/urls.dart';
import 'package:http/http.dart' as http;

// Getting devices
Future<String> devices(Map<String, String> signUpData) async {
  var data = json.encode(signUpData);
  final Uri accountUri = Uri.parse(account);

  http.Response response = await http.post(
    accountUri,
    headers: {
      'Content-Type': 'application/json',
    },
  );
  
  print('object');

  if (response.statusCode == 204)
    return 'Success';
  else if (response.statusCode == 400)
    return 'Bad Request';
  else
    return 'Server Error';
}
