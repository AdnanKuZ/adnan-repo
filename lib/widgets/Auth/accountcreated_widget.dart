import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/screens/auth/login_screen.dart';

class AccountCreatedWidget extends StatelessWidget {
  final bool isPc;
  final bool isMobile;
  final bool? isTablet;

  AccountCreatedWidget(
      {required this.isMobile, this.isTablet, required this.isPc});

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
            SizedBox(
              height: 40,
            ),
            Center(
                child: Icon(
              FontAwesomeIcons.checkCircle,
              color: primaryColor,
              size: 70,
            )),
            SizedBox(
              height: 100,
            ),
            Text(
              'ACCOUNT CREATED',
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
              'Your account has been created successfully',
              style: TextStyle(
                fontFamily: fontFamily,
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'and you can login now',
              style: TextStyle(
                fontFamily: fontFamily,
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 60,
            ),
            Row(children: [
              Expanded(
                child: CustomElevatedButton(
                  onpressed: () {
                    signupMode.setMode("Sign Up");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  buttonColor: primaryColor,
                  icon: FontAwesomeIcons.signInAlt,
                  splashColor: Colors.white,
                  textColor: Colors.white,
                  title: 'Login',
                  iconColor: Colors.white,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
