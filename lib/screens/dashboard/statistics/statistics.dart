import 'package:flutter/cupertino.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16,horizontal: 48),
            child: Column(
      children: [
        DashboardHeader(),
      ],
    )));
  }
}