import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/screens/auth/sign_up_screen.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PassChangedWidget extends StatelessWidget {
  final bool isPc;
  final bool isMobile;
  final bool? isTablet;

  PassChangedWidget(
      {required this.isMobile, this.isTablet, required this.isPc});

  @override
  Widget build(BuildContext context) {
    final loginmode = Provider.of<LoginModes>(context, listen: false);
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
            SizedBox(height: 40,),
            Center(
              child: Icon(
                FontAwesomeIcons.lock,
                color: primaryColor,
                size: 70,
              )
            ),
            SizedBox(height: 100,),
            Text(
              'PASSWORD CHANGED',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Your old password has been changed',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'successfully',
              style: TextStyle(
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
                    loginmode.setMode('Login');
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
