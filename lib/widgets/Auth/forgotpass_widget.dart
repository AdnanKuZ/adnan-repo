import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ForgotPassWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool isPc;
  final bool isMobile;
  final bool? isTablet;

  ForgotPassWidget({required this.isMobile, this.isTablet, required this.isPc});

  @override
  Widget build(BuildContext context) {
    final loginmode = Provider.of<LoginModes>(context,listen: false);
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
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'order to reset password',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 55,
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: CustomTextField(
                state: false,
                hintText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  // if (emailController. )
                  //   return 'email invalid';
                  // else
                  return null;
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
                  title: 'Reset Password',
                  iconColor: Colors.white,
                  onpressed: () {
                    loginmode.setMode('Reset Pass');
                  },
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
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
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
