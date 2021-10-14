import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/repositories/authRepo.dart';

class ForgotPassWidget extends StatelessWidget {
  final emailController = TextEditingController();

  final bool isPc;
  final bool isMobile;
  final bool? isTablet;
  final GlobalKey<FormState> loginFormKey;

  ForgotPassWidget(
      {required this.isMobile,
      this.isTablet,
      required this.isPc,
      required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    final loginmode = Provider.of<LoginModes>(context, listen: false);
    final emailValidProvider = Provider.of<EmailValidProvider>(context);
    return Container(
      height: 500,
      width: 480,
      decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: isPc
              ? BorderRadius.only(bottomRight: Radius.circular(40)) /////Mobile
              : BorderRadius.circular(40)),
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
              'FORGOT PASSWORD',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter the email you are connected with in',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'order to reset password',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 55,
            ),
            Form(
              key: loginFormKey,
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
                      color: state.validState ? primaryColor : Colors.grey,
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
              height: 120,
            ),
            Row(children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonColor: primaryColor,
                  icon: FontAwesomeIcons.shieldAlt,
                  splashColor: Colors.white,
                  textColor: Colors.white,
                  title: 'Reset Pass',
                  iconColor: Colors.white,
                  onpressed: () async {
                    if (loginFormKey.currentState!.validate()) {
                      var result =
                        await requestResetPass(emailController.text);
                    if (result)
                      loginmode.setMode('Reset Pass');
                    else
                      print("request failed");
                    }
                  },
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontFamily: fontFamily,
                        color: Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      loginmode.setMode('Login');
                    },
                    child: Text('sign in',
                        style: TextStyle(
                          fontFamily: fontFamily,
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
