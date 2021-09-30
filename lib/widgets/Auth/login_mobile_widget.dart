import 'package:admin/constants.dart';
import 'package:admin/widgets/Auth/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginMobileWidget extends StatefulWidget {
  const LoginMobileWidget({Key? key}) : super(key: key);
  @override
  _LoginMobileWidgetState createState() {
    // TODO: implement createState
    return _LoginMobileWidgetState();
  }
}

class _LoginMobileWidgetState extends State {
  bool hidePass = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    hidePass = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 500,
      decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(40)),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'USER LOGIN',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter your credentials to login now',
              style: TextStyle(
                  color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 25,
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
            CustomTextField(
              state: false,
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // if (emailController. )
                //   return 'email invalid';
                // else
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePass = !hidePass;
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.eye,
                  color: hidePass ? primaryColor : Colors.grey,
                  size: 16,
                ),
              ),
              state: hidePass,
              hintText: 'Enter password',
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty || value.length < 6)
                  return 'password invalid';
                else
                  return null;
              },
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
                  onPressed: () {},
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
            Row(children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonColor: primaryColor,
                  icon: FontAwesomeIcons.signInAlt,
                  splashColor: Colors.white,
                  textColor: Colors.white,
                  title: 'Login',
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
                  buttonColor: Colors.white,
                  icon: FontAwesomeIcons.userPlus,
                  splashColor: primaryColor,
                  textColor: primaryColor,
                  title: 'Sign Up',
                  iconColor: primaryColor,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
