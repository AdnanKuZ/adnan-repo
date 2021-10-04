import 'package:admin/models/contactUs.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class ContactUsProvider with ChangeNotifier {
  final String? _token;

  ContactUsProvider(this._token);

  Future<bool> addMessage(ContactUs contactUs) async {
    print('fuck ${contactUs.firstName}');
    //final encodedData = json.encode({});
    return false;
  }
}
