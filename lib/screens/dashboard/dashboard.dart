import 'package:admin/enums/RouteEnum.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/policies/policies.dart';
import 'package:admin/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'home/home.dart';

class DashboardScreen extends StatelessWidget {
  int getStackIndex(DashboardRoute route) {
    switch (route) {
      case DashboardRoute.Home:
        return 0;
      case DashboardRoute.Policies:
        return 1;
      case DashboardRoute.Statistics:
        return 2;
      case DashboardRoute.ContactUs:
        return 3;
      case DashboardRoute.About:
        return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProvider>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (!Responsive.isMobile(context))
              SideMenu(),

            Expanded(
                //child: HomeScreen(),
                child: IndexedStack(
                  index: getStackIndex(
                      Provider.of<MenuProvider>(context).dashboardRoute),
                  children: [HomeScreen(), PoliciesScreen()],
                )),
          ],
          // if (Provider.of<MenuProvider>(context).dashboardRoute ==
          //               DashboardRoute.Home)
          //             HomeScreen(),
          //           if (Provider.of<MenuProvider>(context).dashboardRoute ==
          //               DashboardRoute.Policies)
          //             PoliciesScreen()
        ),
      ),
    );
  }
}
