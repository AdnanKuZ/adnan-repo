import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepositories {
  final String baseUrl = 'https://sohobuiserver.azurewebsites.net//api/Account/';
  void register(Map<String, String> authData) async {
    final Uri url = Uri.parse('$baseUrl' + 'Register');
    print(url);
    print(authData);
    var encode = json.encode(authData);
    print(encode);
    http.Response response = await http.post(
      url,
      body: encode,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('body : ' + response.body);
    print('status code : ' + response.statusCode.toString());
    var jsonResponse = jsonDecode(response.body);
    print('json response : ' + jsonResponse);
  }
}
