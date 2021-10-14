import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/login_widget.dart';
import 'package:admin/widgets/Auth/readMore.dart';
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
  final loginScreenFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _loginMode = Provider.of<LoginModes>(context, listen: false);
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
                child: Image.asset(
                  'assets/images/background_new.jpeg',
                  fit: BoxFit.cover,
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black87.withOpacity(0.5),
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
                                        loginFormKey: loginScreenFormKey,
                                        isMobile: false,
                                        isPc: true,
                                      )
                                    : _loginMode.mode ==
                                            'Forgot Pass' /////////////
                                        ? ForgotPassWidget(
                                            loginFormKey: loginScreenFormKey,
                                            isMobile: false,
                                            isPc: true,
                                          )
                                        : _loginMode.mode ==
                                                'Reset Pass' //////////////
                                            ? ResetPassWidget(
                                                loginFormKey:
                                                    loginScreenFormKey,
                                                isMobile: false,
                                                isPc: true,
                                              )
                                            : _loginMode.mode ==
                                                    'Changed Pass' //////////////4
                                                ? PassChangedWidget(
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
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                "assets/images/logo.png",
                              )),
                          SizedBox(
                            height: 50,
                          ),
                          Consumer<LoginModes>(
                              builder: (context, state, child) => _loginMode
                                          .mode ==
                                      'Login' ///////////
                                  ? LoginWidget(
                                      loginFormKey: loginScreenFormKey,
                                      isMobile: false,
                                      isPc: false,
                                    )
                                  : _loginMode.mode ==
                                          'Forgot Pass' /////////////
                                      ? ForgotPassWidget(
                                          loginFormKey: loginScreenFormKey,
                                          isMobile: false,
                                          isPc: false,
                                        )
                                      : _loginMode.mode ==
                                              'Reset Pass' //////////////
                                          ? ResetPassWidget(
                                              loginFormKey: loginScreenFormKey,
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
                        builder: (context, state, child) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            _loginMode.mode == 'Login' ///////////1
                                ? LoginWidget(
                                    loginFormKey: loginScreenFormKey,
                                    isMobile: true,
                                    isPc: false,
                                  )
                                : _loginMode.mode ==
                                        'Forgot Pass' /////////////2
                                    ? ForgotPassWidget(
                                        loginFormKey: loginScreenFormKey,
                                        isMobile: true,
                                        isPc: false,
                                      )
                                    : _loginMode.mode ==
                                            'Reset Pass' //////////////3
                                        ? ResetPassWidget(
                                            loginFormKey: loginScreenFormKey,
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
