import 'package:admin/dialogs/settings_dialog.dart';
import 'package:admin/enums/RouteEnum.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/contact_us/contact_us.dart';
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
      case DashboardRoute.MembersAndDevices:
        return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProvider>().scaffoldKey,
      drawer: SafeArea(child: SideMenu()),
      appBar: Responsive.isMobile(context)
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 8,
              centerTitle: true,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              title: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset("assets/images/logo.png")),
              actions: [
                IconButton(
                  onPressed: () {
                    SettingsDialog(context: context);
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (!Responsive.isMobile(context)) SideMenu(),

            Expanded(
                //child: HomeScreen(),
                child: IndexedStack(
              index: getStackIndex(
                  Provider.of<MenuProvider>(context).dashboardRoute),
              children: [
                HomeScreen(),
                PoliciesScreen(),
                SizedBox(),
                ConctactUsScreen(),
                SizedBox(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
