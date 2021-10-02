import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/widgets/Auth/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ResetPassWidget extends StatelessWidget {
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool isPc;
  final bool isMobile;
  final bool? isTablet;

  ResetPassWidget({required this.isMobile, this.isTablet, required this.isPc});

  @override
  Widget build(BuildContext context) {
    final loginmode = Provider.of<LoginModes>(context);
    final passProvider = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(
      builder: (context, state, child) => Container(
        height: 500,
        width: 480,
        decoration: BoxDecoration(
            color: Color(0XFFFFFFFF),
            borderRadius: isPc
                ? BorderRadius.only(
                    bottomRight: Radius.circular(40)) /////Mobile
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
                'PASSWORD RESET',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Enter the new password twice in order',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'to change password',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 48,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      state: false,
                      hintText: 'Password',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty || value.length < 6)
                          return 'password invalid';
                        else
                          return null;
                      },
                    ),
                    SizedBox(
                       height: 18,
                    ),
                    CustomTextField(
                      state: false,
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value != passController.text)
                          return 'password does not match';
                        else
                          return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70,),
              Row(children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonColor: primaryColor,
                    icon: FontAwesomeIcons.shieldAlt,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                    title: 'Change Password',
                    iconColor: Colors.white,
                    onpressed: () {
                      loginmode.setMode('Changed Pass');
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
      ),
    );
  }
}
