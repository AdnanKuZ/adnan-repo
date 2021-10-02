import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/login_widget.dart';
import 'package:admin/widgets/Auth/readMore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:admin/widgets/Auth/changedpass_widget.dart';
import 'package:admin/widgets/Auth/forgotpass_widget.dart';
import 'package:admin/widgets/Auth/resetpass_widget.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/authProviders.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final _loginMode = Provider.of<LoginModes>(context,listen:false);
    
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
                          Consumer<LoginModes>(
                            ////////////
                            builder: (context, state, child) => Align(
                                alignment: Alignment.centerRight,
                                child: _loginMode.mode == 'Login' ///////////
                                    ? LoginWidget(
                                        isMobile: false,
                                        isPc: true,
                                      )
                                    : _loginMode.mode ==
                                            'Forgot Pass' /////////////
                                        ? ForgotPassWidget(
                                          isMobile: false,
                                          isPc: true,
                                        )
                                        : _loginMode.mode ==
                                                'Reset Pass' //////////////
                                            ? ResetPassWidget(
                                              isMobile: false,
                                              isPc: true,
                                            )
                                            : _loginMode.mode ==
                                                    'Changed Pass' //////////////4
                                                ? PassChangedWidget(
                                                  isMobile: false,
                                                  isPc: true,
                                                )
                                                : Container()
                           ),
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
                          child: Column(
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
                          Consumer<LoginModes>(
                              builder: (context, state, child) => _loginMode
                                          .mode ==
                                      'Login' ///////////
                                  ? LoginWidget(
                                      isMobile: false,
                                      isPc: false,
                                    )
                                  : _loginMode.mode == 'Forgot Pass' /////////////
                                      ? ForgotPassWidget(
                                        isMobile: false,
                                        isPc: false,
                                      )
                                      : _loginMode.mode ==
                                              'Reset Pass' //////////////
                                          ? ResetPassWidget(
                                            isMobile: false,
                                            isPc: false,
                                          )
                                          : _loginMode.mode ==
                                                  'Changed Pass' //////////////4
                                              ? PassChangedWidget(
                                                isMobile: false,
                                                isPc: false,
                                              )
                                              : Container()),
                        ],
                      )),
                    );
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Consumer<LoginModes>(
                        builder: (context,state,child) =>
                        Column(
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
                            _loginMode.mode == 'Login' ///////////1
                                ? LoginWidget(
                                    isMobile: true,
                                    isPc: false,
                                  )
                                : _loginMode.mode == 'Forgot Pass' /////////////2
                                    ? ForgotPassWidget(
                                      isMobile: true,
                                      isPc: false,
                                    )
                                    : _loginMode.mode == 'Reset Pass' //////////////3
                                        ? ResetPassWidget(
                                          isMobile: true,
                                          isPc: false,
                                        )
                                        : _loginMode.mode ==
                                                'Changed Pass' //////////////4
                                            ? PassChangedWidget(
                                              isMobile: true,
                                              isPc: false,
                                            )
                                            : Container()
                          ],
                        ),
                      ),
                    );
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
