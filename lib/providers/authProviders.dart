import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool passHidden = false;
  bool get state => passHidden;
  void setPassState(bool state) {
    passHidden = state;
    notifyListeners();
  }
}

class LoginModes extends ChangeNotifier {
  ///MODES:
  ///'Login'
  ///'Forgot Pass'
  ///'Reset Pass'
  ///'Changed Pass'
  String loginMode = 'Changed Pass';
  String get mode => loginMode;
  void setMode(String mode) {
    loginMode = mode;
    notifyListeners();
  }
}

class SignUpModes extends ChangeNotifier {
  ///MODES:
  ///'Sign Up'
  ///'Otp'
  ///'Account Created'
  String signupMode = 'Sign Up';
  String get mode => signupMode;
  void setMode(String mode) {
    signupMode = mode;
    notifyListeners();
  }
}

                          
                         
                              