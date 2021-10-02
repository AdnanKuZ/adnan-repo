import 'package:admin/constants.dart';
import 'package:admin/widgets/Auth/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/text_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/screens/auth/login_screen.dart';

class SignUpWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final bool isPc;
  final bool isMobile;
  final bool? isTablet;

  SignUpWidget({required this.isMobile, this.isTablet, required this.isPc});

  @override
  Widget build(BuildContext context) {
    final passProvider = Provider.of<AuthProvider>(context);
    final signupMode = Provider.of<SignUpModes>(context, listen: false);
    return Container(
      height: 565,
      width: 500,
      decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: isPc
              ? BorderRadius.only(bottomRight: Radius.circular(40))
              : BorderRadius.circular(40)),
      padding: isPc
          ? EdgeInsets.symmetric(horizontal: 85, vertical: 40)
          : isMobile
              ? EdgeInsets.symmetric(horizontal: 20, vertical: 40)
              : EdgeInsets.symmetric(horizontal: 70, vertical: 40),
      child: SingleChildScrollView(
        child: Consumer<SignUpModes>(
            builder: (context, mode, child) => Column(
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
                      height: 33,
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
                                passProvider.setPassState(!passProvider.state);
                              },
                              icon: Icon(
                                FontAwesomeIcons.eye,
                                color: passProvider.state
                                    ? primaryColor
                                    : Colors.grey,
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
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            state: passProvider.state,
                            hintText: 'Confirm password',
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
                            state: false,
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
                      height: 25,
                    ),
                    Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onpressed: () {
                            signupMode.setMode("Account Created");
                          },
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
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
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
                )),
      ),
    );
  }
}
