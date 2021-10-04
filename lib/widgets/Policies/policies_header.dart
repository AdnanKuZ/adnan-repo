import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';
import 'package:admin/widgets/dashboard/dashboard_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class PoliciesHeader extends StatelessWidget {
  final bool showAddButton;
  final Function onSettingsPressed;
  const PoliciesHeader(
      {required this.showAddButton, required this.onSettingsPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardHeader(),
        DashboardTitle(title: 'Policies',
          descriptions: 'Check your ongoing policies and manage them!',
          showAddButton: showAddButton,)
      ],
    );
  }
}
