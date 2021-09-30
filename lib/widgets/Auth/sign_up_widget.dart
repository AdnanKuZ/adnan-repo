import 'package:admin/constants.dart';
import 'package:admin/widgets/Auth/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);
  @override
  _SignUpWidgetState createState() {
    // TODO: implement createState
    return _SignUpWidgetState();
  }
}

class _SignUpWidgetState extends State {
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
      height: 555,
      width: 500,
      decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40))),
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SIGN UP',
              style: TextStyle(
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
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
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
                    controller: passController,
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
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    state: hidePass,
                    hintText: 'ReEnter password',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value != passController.text)
                        return 'password does not match';
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    state: hidePass,
                    hintText: 'Device identifier',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      // if (value != passController.text)
                      //   return 'password does not match';
                      // else
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
        ),
      ),
    );
  }
}
