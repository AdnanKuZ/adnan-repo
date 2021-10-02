import 'package:admin/constants.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/screens/auth/sign_up_screen.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  // final textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool isPc;
  final bool isMobile;
  final bool? isTablet;

  LoginWidget({required this.isMobile, this.isTablet, required this.isPc});

  @override
  Widget build(BuildContext context) {
    final passProvider = Provider.of<AuthProvider>(context);
    final loginmode = Provider.of<LoginModes>(context,listen: false);
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
                      height: 18,
                    ),
                    CustomTextField(
                      suffixIcon: IconButton(
                        onPressed: () {
                          passProvider.setPassState(!passProvider.state);
                        },
                        icon: Icon(
                          FontAwesomeIcons.eye,
                          color:
                              passProvider.state ? primaryColor : Colors.grey,
                          size: 16,
                        ),
                      ),
                      state: passProvider.state,
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
                    onPressed: () {
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
              Row(children: [
                Expanded(
                  child: CustomElevatedButton(
                    onpressed: () {},
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
                    onpressed: () {
                      // loginmode.setMode("Sign Up");
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
      ),
    );
  }
}
