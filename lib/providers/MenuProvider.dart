// import 'dart:html';

import 'package:admin/enums/RouteEnum.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
<<<<<<< HEAD
  DashboardRoute dashboardRoute = DashboardRoute.ContactUs;
=======
  DashboardRoute dashboardRoute = DashboardRoute.Policies;
>>>>>>> 3509764ae2db05ed7ef05d1a88c8ec54ded9080c

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setDashboardRoute(DashboardRoute dashboardRoute) {
    try {
      this.dashboardRoute = dashboardRoute;
      print(dashboardRoute.toString());
      notifyListeners();
    } catch (exception) {
      print(exception);
    }
  }
}
