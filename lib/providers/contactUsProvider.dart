import 'package:admin/models/contactUs.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class ContactUsProvider with ChangeNotifier {
  final String? _token;

  ContactUsProvider(this._token);

  Future<bool> addMessage(ContactUs contactUs) async {
    //final encodedData = json.encode({});
    return false;
  }
}
