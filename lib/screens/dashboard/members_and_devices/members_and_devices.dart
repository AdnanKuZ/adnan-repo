import 'package:admin/constants.dart';
import 'package:admin/dialogs/settings_dialog.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/members_and_devices/members_and_devices_header.dart';
import 'package:admin/widgets/dashboard/policies/policies_body.dart';
import 'package:admin/widgets/dashboard/policies/policies_header.dart';
import 'package:admin/widgets/dashboard/policies/policy/policy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MembersAndDevicesScreen extends StatefulWidget {
  @override
  State<MembersAndDevicesScreen> createState() =>
      _MembersAndDevicesScreenState();
}

class _MembersAndDevicesScreenState extends State<MembersAndDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            Responsive.isMobile(context) ? defaultPadding : menuPadding,
            defaultPadding,
            defaultPadding,
            0),
        child: Column(
          children: [
            MembersAndDevicesHeader(showAddButton: false),
            Expanded(child: Container(child: PoliciesEmptyBody()))
          ],
        ),
      ),
    );
  }
}
