import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:admin/widgets/Auth/login_widget.dart';
import 'package:admin/widgets/Auth/login_mobile_widget.dart';
import 'package:admin/widgets/Auth/readMore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 850) {
                  return Container(
                    width: 840,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: LoginWidget()),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ReadMoreWidget(
                            controller: pageController,
                          )
                        ),
                      ],
                    ),
                  );
                } else if (constraints.maxWidth < 850 &&
                    constraints.maxWidth >= 520) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: LoginWidget(),
                    ),
                  );
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: Icon(FontAwesomeIcons.addressCard,color: Colors.white,size: 50,),
                        ),
                        SizedBox(height: 50,),
                        LoginMobileWidget(),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
