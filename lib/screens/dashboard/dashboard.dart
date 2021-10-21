import 'package:admin/dialogs/settings_dialog.dart';
import 'package:admin/enums/RouteEnum.dart';
import 'package:admin/models/metadata.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/conncetionProvider.dart';
import 'package:admin/providers/metaDataProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/FAQs/faqs.dart';
import 'package:admin/screens/dashboard/contact_us/contact_us.dart';
import 'package:admin/screens/dashboard/members_and_devices/members_and_devices.dart';
import 'package:admin/screens/dashboard/policies/policies.dart';
import 'package:admin/server/requests.dart';
import 'package:admin/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'package:provider/provider.dart';
import 'package:admin/screens/dashboard/statistics/statistics.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State {
  late Future<void> loadMetaDataFuture = loadMetaData();

  Future<MetadataModel> loadMetaData() async {
    print('fashboard metadata');
    final provider = Provider.of<MetadataProvider>(context, listen: false);
    final connectionProvider =
        Provider.of<ConnectionProvider>(context, listen: false);
    final meta = await requestMetadata();
    provider.setMetaData(meta);
    if ((meta.ports?.length ?? 0) > 0)
      connectionProvider.setConnectionDropDownValueForAllDays(meta.ports![0]);
    return meta;
  }

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
      case DashboardRoute.FAQs:
        return 4;
      case DashboardRoute.MembersAndDevices:
        return 6;
      case DashboardRoute.TermsAndConditions:
        return 5;
      case DashboardRoute.LegalStatement:
        return 7;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProvider>().scaffoldKey,
      drawer: SideMenu(),
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
            // Web side menu
            if (!Responsive.isMobile(context)) SideMenu(),
            Expanded(
                child: FutureBuilder(
                    future: loadMetaDataFuture,
                    builder: (context, snapshot) {
                      return IndexedStack(
                        index: getStackIndex(
                            Provider.of<MenuProvider>(context).dashboardRoute),
                        children: [
                          HomeScreen(),
                          PoliciesScreen(),
                          Statistics(),
                          ConctactUsScreen(),
                          FAQsScreen(),
                          SizedBox(),
                          // MembersAndDevicesScreen(),
                          SizedBox(),
                          // Terms And Conditions
                          SizedBox(),
                          // Legal Statment
                          SizedBox()
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
