import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:admin/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ReadMoreWidget extends StatelessWidget {
  final PageController controller;
  ReadMoreWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 370,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 3),
            )
          ]),
      padding: EdgeInsets.only(right: 38, left: 38, top: 32, bottom: 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              child: Image.asset(
                'assets/images/logo.png',
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //////////////////////////////////
            Container(
              height: 170,
              width: 285,
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.red,
                        child: RichText(
                          text: TextSpan(
                              text: 'Welcome to ',
                              style: TextStyle(fontFamily: fontFamily,color: Colors.white, fontSize: 18),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'OneFi',
                                    style: TextStyle(fontFamily: fontFamily,
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600))
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          // color: Colors.red,
                          height: 100,
                          width: 285,
                          child: Text(
                            'Providing an unprecedented Internet experience. Some might think it’s just a router when it’s actually much more',
                            style: TextStyle(fontFamily: fontFamily,color: Colors.white, fontSize: 14),
                          )),
                    ],
                  ),
              // PageView(a
            ),
            /////////////////////////////////
            // SizedBox(
            //   height: 8,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     controller.nextPage(
            //         duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            //   },
            //   child: Text(
            //     'Read More',
            //     style: TextStyle(fontSize: 12),
            //   ),
            //   style: ElevatedButton.styleFrom(primary: Color(0xFFADD16F)),
            // ),
            // SizedBox(
            //   height: 28,
            // ),
            // Center(
            //   child: SmoothPageIndicator(
            //     controller: controller,
            //     count: 3,
            //     effect: ExpandingDotsEffect(
            //       dotHeight: 4,
            //       spacing: 8,
            //       activeDotColor: Colors.white,
            //       dotColor: Color(0xFFAAD464),
            //       dotWidth: 6,
            //     ),
            //     axisDirection: Axis.horizontal,
            //     onDotClicked: (index) {
            //       controller.jumpToPage(index);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
