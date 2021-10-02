import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/readMore.dart';
import 'package:admin/widgets/Auth/sign_up_widget.dart';
import 'package:admin/widgets/Auth/otp_widget.dart';
import 'package:admin/widgets/Auth/accountcreated_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/authProviders.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final signupMode = Provider.of<SignUpModes>(context,listen: false);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(
                        'images/igor-miske-Px3iBXV-4TU-unsplash.jpg',
                      ),
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
              ),
            ),
            SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= 850) {
                    return Container(
                      width: 840,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Consumer<SignUpModes>(
                            builder: (context, state, child) => Align(
                                alignment: Alignment.centerRight,
                                child: signupMode.mode == 'Sign Up' ///////////
                                    ? SignUpWidget(
                                        isMobile: false,
                                        isPc: true,
                                      )
                                    : signupMode.mode == 'Otp' /////////////
                                        ? OtpWidget(
                                          isMobile: false,
                                          isPc: true,
                                        )
                                        : signupMode.mode ==
                                                'Account Created' //////////////
                                            ? AccountCreatedWidget(
                                              isMobile: false,
                                              isPc: true,
                                            )
                                            : Container()),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: ReadMoreWidget(
                                controller: pageController,
                              )),
                        ],
                      ),
                    );
                  } else if (constraints.maxWidth < 850 &&
                      constraints.maxWidth >= 520) {
                    return Container(
                      child: Center(
                        child: Consumer<SignUpModes>(
                          builder: (context, state, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  FontAwesomeIcons.addressCard,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              signupMode.mode == 'Sign Up' ///////////
                                  ? SignUpWidget(
                                      isMobile: false,
                                      isPc: false,
                                    )
                                  : signupMode.mode == 'Otp' /////////////
                                      ? OtpWidget(
                                        isMobile: false,
                                        isPc: false,
                                      )
                                      : signupMode.mode ==
                                              'Account Created' //////////////
                                          ? AccountCreatedWidget(
                                            isMobile: false,
                                            isPc: false,
                                          )
                                          : Container()
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Consumer<SignUpModes>(
                          builder: (context, state, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  FontAwesomeIcons.addressCard,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              signupMode.mode == 'Sign Up' ///////////
                                  ? SignUpWidget(
                                      isMobile: false,
                                      isPc: false,
                                    )
                                  : signupMode.mode == 'Otp' /////////////
                                      ? OtpWidget(
                                        isMobile: false,
                                        isPc: false,
                                      )
                                      : signupMode.mode ==
                                              'Account Created' //////////////
                                          ? AccountCreatedWidget(
                                            isMobile: false,
                                            isPc: false,
                                          )
                                          : Container()
                            ],
                          ),
                        ));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
