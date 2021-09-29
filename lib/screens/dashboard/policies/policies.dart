import 'package:admin/constants.dart';
import 'package:admin/widgets/policies_body.dart';
import 'package:admin/widgets/policies_header.dart';
import 'package:admin/widgets/recent_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';

class PoliciesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            menuPadding, defaultPadding, defaultPadding, defaultPadding),
        child: Container(
          width: 1200,
          child: Column(
            children: [
              PoliciesHeader(),
              //PoliciesBody(),
              Container(
                color: Color(0xFFFAFAFA),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(height: defaultPadding),
                          RecentFiles(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // // On Mobile means if the screen is less than 850 we dont want to show it
                    // if (!Responsive.isMobile(context))
                    //   Expanded(
                    //     flex: 2,
                    //     child: StarageDetails(),
                    //   ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
