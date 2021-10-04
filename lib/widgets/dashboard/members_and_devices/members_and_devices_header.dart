import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';
import 'package:admin/widgets/dashboard/dashboard_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class MembersAndDevicesHeader extends StatelessWidget {
  final bool showAddButton;
  const MembersAndDevicesHeader({required this.showAddButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardHeader(),
        DashboardTitle(
          title: 'Members And Devices',
          descriptions: 'Check your current members and devices configurations',
          showAddButton: showAddButton,
        )
      ],
    );
  }
}
