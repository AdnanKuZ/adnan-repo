import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class OtpWidget extends StatelessWidget {
  final bool isPc;
  final bool isMobile;
  final bool? isTablet;

  OtpWidget({required this.isMobile, this.isTablet, required this.isPc});

  @override
  Widget build(BuildContext context) {
    final signupMode = Provider.of<SignUpModes>(context, listen: false);
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
            SizedBox(height: 20),
            Text(
              'OTP',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter the 4-digits code sent to your email',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'in order to verify account',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            VerificationCode(
              length: 4,
              underlineColor: Colors.black54,
              textStyle: TextStyle(color: Colors.black87, fontSize: 30),
              keyboardType: TextInputType.number,
              clearAll: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'clear all',
                  style: TextStyle(
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blue[700]),
                ),
              ),
              onCompleted: (String value) {},
              onEditing: (bool value) {},
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\' recieve code yet?',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    // signupMode.setMode('Login');
                  },
                  child: Text('Resend',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonColor: primaryColor,
                  icon: FontAwesomeIcons.check,
                  splashColor: Colors.white,
                  textColor: Colors.white,
                  title: 'Verify Account',
                  iconColor: Colors.white,
                  onpressed: () {
                    signupMode.setMode('Account Created');
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
