import 'package:admin/constants.dart';
import 'package:admin/widgets/LogIn/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/LogIn/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);
  @override
  _LoginWidgetState createState() {
    // TODO: implement createState
    return _LoginWidgetState();
  }
}

class _LoginWidgetState extends State {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        width: 500,
        decoration: BoxDecoration(
            color: Color(0XFFFFFFFF),
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(40))),
        padding: EdgeInsets.symmetric(horizontal: 70,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'USER LOGIN',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
            ),
            Expanded(
              child: Text(
                'Enter your credentials to login now',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(flex: 2,
              child: Stack(children: [
                CustomTextField(
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.text,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.check,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                )
              ]),
            ),
            Expanded(flex:2,
              child: Stack(children: [
                CustomTextField(
                  hintText: 'Enter password',
                  keyboardType: TextInputType.text,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            ),
            Expanded(flex:2,
              child: Row(children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonColor: primaryColor,
                    icon: Icons.ac_unit,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                    title: 'Login',
                    iconColor: Colors.white,
                  ),
                ),
              ]),
            ),
            Expanded(flex:2,
              child: Row(children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonColor: Colors.white,
                    icon: Icons.access_alarm,
                    splashColor: primaryColor,
                    textColor: primaryColor,
                    title: 'Sign Up',
                    iconColor: primaryColor,
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
  }
}

