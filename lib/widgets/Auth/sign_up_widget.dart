import 'package:admin/constants.dart';
import 'package:admin/repositories/authRepo.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/screens/auth/login_screen.dart';

class SignUpWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final deviceIdController = TextEditingController();
  final textFieldController = TextEditingController();
  final _authRepo = AuthRepositories();

  final bool isPc;
  final bool isMobile;
  final bool? isTablet;
  final GlobalKey<FormState> signUpFormKey;

  SignUpWidget(
      {required this.isMobile,
      this.isTablet,
      required this.isPc,
      required this.signUpFormKey});

  @override
  Widget build(BuildContext context) {
    final passHiddenProvider = Provider.of<PassHiddenProvider>(context,listen: false);
    final emailValidProvider = Provider.of<EmailValidProvider>(context);
    final signupMode = Provider.of<SignUpModes>(context, listen: false);
    Map<String, String> authData = {
      "email": "",
      "password": "",
      "deviceId": "",
    };
    return Container(
      height: 550,
      width: 480,
      decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: isPc
              ? BorderRadius.only(bottomRight: Radius.circular(40))
              : BorderRadius.circular(30)),
      padding: isPc
          ? EdgeInsets.symmetric(horizontal: 85, vertical: 50)
          : isMobile
              ? EdgeInsets.symmetric(horizontal: 15, vertical: 40)
              : EdgeInsets.symmetric(horizontal: 70, vertical: 40),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'SIGN UP',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Fill the data below to create your account',
            style: TextStyle(
                color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 33,
          ),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: signUpFormKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade50.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      )
                    ]),
                  child: CustomTextField(
                    onChanged: (value) {
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)
                          ? emailValidProvider.setEmailState(true)
                          : emailValidProvider.setEmailState(false);
                    },
                    controller: emailController,
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Consumer<EmailValidProvider>(
                          builder: (context, state, child) => Icon(
                                FontAwesomeIcons.check,
                                color:
                                    state.validState ? primaryColor : Colors.grey,
                                size: 16,
                              )),
                    ),
                    state: false,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty &&
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value))
                        return 'email invalid';
                      else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade50.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      )
                    ]),
                  child: CustomTextField(
                    maxLines: 1,
                    controller: passController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        passHiddenProvider
                            .setPassState(!passHiddenProvider.state);
                      },
                      icon: Consumer<PassHiddenProvider>(
                          builder: (context, state, child) => Icon(
                                FontAwesomeIcons.eye,
                                color: state.state ? primaryColor : Colors.grey,
                                size: 16,
                              )),
                    ),
                    state: passHiddenProvider.state,
                    hintText: 'Enter password',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty ||
                          value.length < 8 ||
                          !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value))
                        return 'password invalid';
                      else
                        return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade50.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      )
                    ]),
                  child: CustomTextField(
                    maxLines: 1,
                    state: passHiddenProvider.state,
                    hintText: 'Confirm password',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value != passController.text)
                        return 'password does not match';
                      else
                        return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade50.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      )
                    ]),
                  child: CustomTextField(
                    controller: deviceIdController,
                    state: false,
                    hintText: 'Device identifier',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      // if (value != passController.text)
                      //   return 'password does not match';
                      // else
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(children: [
            Expanded(
              child: CustomElevatedButton(
                onpressed: () async {
                  if (signUpFormKey.currentState!.validate()) {
                    authData = {
                      "email": emailController.text,
                      "password": passController.text,
                      "deviceId": deviceIdController.text,
                    };
                    var result = await _authRepo.register(authData);
                    if(result == 'Success') {
                      signupMode.setMode("Otp");
                    }else if(result == 'Bad Request') {
                      print('bad request');
                    }else
                      print('server error');
                  }
                },
                buttonColor: primaryColor,
                icon: FontAwesomeIcons.userPlus,
                splashColor: Colors.white,
                textColor: Colors.white,
                title: 'Sign Up',
                iconColor: Colors.white,
              ),
            ),
          ]),
          SizedBox(
            height: 12,
          ),
          Row(children: [
            Expanded(
              child: CustomElevatedButton(
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                buttonColor: Colors.white,
                icon: FontAwesomeIcons.signInAlt,
                splashColor: primaryColor,
                textColor: primaryColor,
                title: 'Login',
                iconColor: primaryColor,
              ),
            ),
          ]),
        ],
      )),
    );
  }
}
