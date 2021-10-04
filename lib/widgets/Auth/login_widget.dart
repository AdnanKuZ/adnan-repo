import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/screens/auth/sign_up_screen.dart';
import 'package:admin/screens/dashboard/dashboard.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/repositories/authRepo.dart';

class LoginWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _authRepo = AuthRepositories();
  final bool isPc;
  final bool isMobile;
  final bool? isTablet;
  final GlobalKey<FormState> loginFormKey;

  LoginWidget(
      {required this.isMobile,
      this.isTablet,
      required this.isPc,
      required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    final passHiddenProvider =
        Provider.of<PassHiddenProvider>(context, listen: false);
    final emailValidProvider =
        Provider.of<EmailValidProvider>(context, listen: false);
    final loginmode = Provider.of<LoginModes>(context, listen: false);
    final isLoading = Provider.of<IsLoading>(context, listen: false);
    Map<String, String> authData = {
      "email": "",
      "password": "",
    };
    return Container(
      height: 500,
      width: 480,
      decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: isPc
              ? BorderRadius.only(bottomRight: Radius.circular(40)) /////Mobile
              : BorderRadius.circular(25)),
      /////Pc and Tablet
      padding: isPc
          ? EdgeInsets.symmetric(horizontal: 85, vertical: 50) //Pc
          : isMobile
              ? EdgeInsets.symmetric(horizontal: 15, vertical: 40) //Mobile
              : EdgeInsets.symmetric(horizontal: 70, vertical: 40), //Tablet
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'USER LOGIN',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter your credentials to login now',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: loginFormKey,
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
                      controller: emailController,
                      onChanged: (value) {
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)
                            ? emailValidProvider.setEmailState(true)
                            : emailValidProvider.setEmailState(false);
                      },
                      suffixIcon: IconButton(
                        onPressed: null,
                        icon: Consumer<EmailValidProvider>(
                          builder: (context, state, child) => Icon(
                            FontAwesomeIcons.check,
                            color:
                                state.validState ? primaryColor : Colors.grey,
                            size: 16,
                          ),
                        ),
                      ),
                      state: false,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'email invalid';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Consumer<PassHiddenProvider>(
                    builder: (context, state, child) => Container(
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
                          icon: Icon(
                            FontAwesomeIcons.eye,
                            color: passHiddenProvider.state
                                ? primaryColor
                                : Colors.grey,
                            size: 16,
                          ),
                        ),
                        state: passHiddenProvider.state,
                        hintText: 'Enter password',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty)
                            return 'password empty';
                          else
                            return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    emailValidProvider.setEmailState(false);
                    loginmode.setMode('Forgot Pass');
                  },
                  child: Text('Forgot Password?',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Consumer<IsLoading>(
              builder: (context, state, child) {
                return Row(children: [
                  Expanded(
                      child: !state.isLoadingState
                          ? CustomElevatedButton(
                              onpressed: () async {
                                authData = {
                                  "email": emailController.text,
                                  "password": passController.text,
                                };

                                if (loginFormKey.currentState!.validate()) {
                                  isLoading.setLoadingState(true);
                                  String result =
                                      await _authRepo.login(authData);
                                  if (result == 'Login Failed') {
                                    print("loginError");
                                    isLoading.setLoadingState(false);
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardScreen()));
                                    isLoading.setLoadingState(false);
                                  }
                                }
                              },
                              buttonColor: primaryColor,
                              icon: FontAwesomeIcons.signInAlt,
                              splashColor: Colors.white,
                              textColor: Colors.white,
                              title: 'Login',
                              iconColor: Colors.white,
                            )
                          : Center(child: CircularProgressIndicator())),
                ]);
              },
            ),
            SizedBox(
              height: 12,
            ),
            Row(children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonColor: Colors.white,
                  icon: FontAwesomeIcons.userPlus,
                  splashColor: primaryColor,
                  textColor: primaryColor,
                  title: 'Sign Up',
                  iconColor: primaryColor,
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
