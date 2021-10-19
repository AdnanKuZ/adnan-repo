import 'package:admin/constants.dart';
import 'package:admin/dialogs/auth_error_dialog.dart';
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
    final passHiddenProvider = Provider.of<PassHiddenProvider>(
      context,
    );
    final emailValidProvider = Provider.of<EmailValidProvider>(context);
    final signupMode = Provider.of<SignUpModes>(context, listen: false);
    final passValidProvider =
        Provider.of<PassValidProvider>(context, listen: false);
    final isLoading = Provider.of<IsLoading>(context, listen: false);
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
          ? EdgeInsets.only(left: 85, right: 85, top: 50, bottom: 30)
          : isMobile
              ? EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 30)
              : EdgeInsets.only(left: 70, right: 70, top: 50, bottom: 30),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'SIGN UP',
            style: TextStyle(
                fontFamily: fontFamily,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Fill the data below to create your account',
            style: TextStyle(
                fontFamily: fontFamily,
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 33,
          ),
          Form(
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
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
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
                                color: state.validState
                                    ? primaryColor
                                    : Colors.grey,
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
                    textInputAction: TextInputAction.next,
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
                                color:
                                    !state.state ? primaryColor : Colors.grey,
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
                    textInputAction: TextInputAction.next,
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
                    textInputAction: TextInputAction.done,
                    suffixIcon: Tooltip(
                      message: 'Check the router for device identifier code',
                      child: Icon(Icons.info_outline_rounded),
                    ),
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
                    submit: (s) async{
                      await submitForm(passValidProvider, authData, isLoading, signupMode, context);
                    },
                  ),
                ),
                Consumer<PassValidProvider>(
                    builder: (context, instance, child) =>
                        instance.passValidState
                            ? SizedBox.shrink()
                            : Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  'password must have : capital letters, small letters, characters and numbers',
                                  style: TextStyle(
                                      fontFamily: fontFamily,
                                      color: Colors.red),
                                ),
                              )),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Consumer<IsLoading>(
            builder: (context, state, child) => Row(children: [
              Expanded(
                child: !state.isLoadingState
                    ? CustomElevatedButton(
                        onpressed: () async {
                          await submitForm(passValidProvider, authData, isLoading, signupMode, context);
                        },
                        buttonColor: primaryColor,
                        icon: FontAwesomeIcons.userPlus,
                        splashColor: Colors.white,
                        textColor: Colors.white,
                        title: 'Sign Up',
                        iconColor: Colors.white,
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ]),
          ),
          SizedBox(
            height: 12,
          ),
          Row(children: [
            Expanded(
              child: CustomElevatedButton(
                onpressed: () {
                  passValidProvider.setPassValidState(true);
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

  Future<void> submitForm(PassValidProvider passValidProvider, Map<String, String> authData, IsLoading isLoading, SignUpModes signupMode, BuildContext context) async {
    signUpFormKey.currentState!.validate()
        ? passValidProvider.setPassValidState(true)
        : passValidProvider.setPassValidState(false);
    authData = {
      "email": emailController.text,
      "password": passController.text,
      "deviceId": deviceIdController.text,
    };
    if (signUpFormKey.currentState!.validate()) {
      isLoading.setLoadingState(true);
      String result = await register(authData);
      if (result == 'Success') {
        signupMode.setMode("Otp");
        isLoading.setLoadingState(false);
      } else if (result == 'Bad Request') {
        print('bad request');
        isLoading.setLoadingState(false);
        showDialog(
            context: context,
            builder: (context) => AuthDialog(
                  title:
                      "Sign up credentials not correct",
                ));
        signupMode.setMode("Otp");
        signupMode.setMode("Sign Up");
      } else if (result == 'Not Allowed') {
        print('Unauthorized');
        showDialog(
            context: context,
            builder: (context) => AuthDialog(
                  title: "you are not allowed to do this",
                ));
        signupMode.setMode("Otp");
        signupMode.setMode("Sign Up");
      } else {
        print('server error');
        showDialog(
            context: context,
            builder: (context) => AuthDialog(
                  title:
                      "Something wrong has happend, Please try again",
                ));
        isLoading.setLoadingState(false);
        signupMode.setMode("Otp");
        signupMode.setMode("Sign Up");
      }
    }
  }
}
