import 'package:admin/enums/RouteEnum.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: menuSeperatorColor,
                width: 1.0,
              ),
            ),
          ),
          child: Column(
            children: [
              // Top menu
              Flexible(
                child: Container(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      ),
                      DrawerListTile(
                        navigation: DashboardRoute.Home,
                        svgSrc: "assets/icons/menu_dashbord.svg",
                      ),
                      DrawerListTile(
                        navigation: DashboardRoute.Policies,
                        svgSrc: "assets/icons/menu_task.svg",
                      ),
                      DrawerListTile(
                        navigation: DashboardRoute.Statistics,
                        svgSrc: "assets/icons/menu_tran.svg",
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom menu
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DrawerListTile(
                      navigation: DashboardRoute.ContactUs,
                      svgSrc: "assets/icons/menu_setting.svg",
                    ),
                    DrawerListTile(
                      navigation: DashboardRoute.About,
                      svgSrc: "assets/icons/menu_setting.svg",
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
