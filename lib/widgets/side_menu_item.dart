import 'package:admin/constants.dart';
import 'package:admin/enums/RouteEnum.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    this.title,
    required this.navigation,
    required this.svgSrc,
  }) : super(key: key);

  final String? title;
  final String svgSrc;
  final DashboardRoute navigation;
  //final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final _providerInstance = Provider.of<MenuProvider>(context, listen: false);
    return ListTile(
      onTap: () {
        // context.read<MenuProvider>().setDashboardRoute(navigation);
        _providerInstance.setDashboardRoute(navigation);
      },
      selected: Provider.of<MenuProvider>(context).dashboardRoute == navigation,
      horizontalTitleGap: 0.0,
      selectedTileColor: menuSelectedBackgroundColor,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
        child: SvgPicture.asset(
          svgSrc,
          color: Provider.of<MenuProvider>(context).dashboardRoute == navigation
              ? menuSelectedIconColor
              : menuUnSelectedIconColor,
          height: 20,
        ),
      ),
      title: (title != null)
          ? Text(
              title!,
              style: TextStyle(color: Colors.white54),
            )
          : null,
    );
  }
}
