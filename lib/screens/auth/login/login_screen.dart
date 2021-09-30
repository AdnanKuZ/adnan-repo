import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/LogIn/login_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
                child: Image.asset(
                  'images/igor-miske-Px3iBXV-4TU-unsplash.jpg',
                  fit: BoxFit.cover,
                ),
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
                          child: Container(
                            height: 350,
                            width: 370,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            padding: EdgeInsets.only(right: 38,left:38,top:38,bottom: 17),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(FontAwesomeIcons.box,color: Colors.white,size: 30,),
                                  SizedBox(height: 15,),
                                  Text('Welcome ')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    child: Center(
                      child: LoginWidget(),
                    ),
                  );
              },
            )
          ],
        ),
      ),
    );
  }
}
// Container(
//               width: 840,
//               height: MediaQuery.of(context).size.height,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Align(
//                       alignment: Alignment.centerRight,
//                       child: LoginWidget()),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Container(
//                       height: 350,
//                       width: 370,
//                       decoration: BoxDecoration(
//                           color: primaryColor,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30)),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.8),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(3, 3),
//                             )
//                           ]),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [Container()],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )