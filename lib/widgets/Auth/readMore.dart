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
      padding: EdgeInsets.only(right: 38, left: 38, top: 32, bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.box,
            color: Colors.white,
            size: 45,
          ),
          SizedBox(
            height: 15,
          ),
          //////////////////////////////////
          Container(
            // color: Colors.lightBlue.shade300,
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
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'OneFi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600))
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        // color: Colors.red,
                        height: 120,
                        width: 285,
                        child: Text(
                          'Lorem ipsum Lorem ipsum Lorem ipsum Lorem Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )),
                  ],
                ),
            // PageView(a
          ),
          /////////////////////////////////
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
            child: Text(
              'Read More',
              style: TextStyle(fontSize: 12),
            ),
            style: ElevatedButton.styleFrom(primary: Color(0xFFADD16F)),
          ),
          SizedBox(
            height: 28,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 4,
                spacing: 8,
                activeDotColor: Colors.white,
                dotColor: Color(0xFFAAD464),
                dotWidth: 6,
              ),
              axisDirection: Axis.horizontal,
              onDotClicked: (index) {
                controller.jumpToPage(index);
              },
            ),
          )
        ],
      ),
    );
  }
}
