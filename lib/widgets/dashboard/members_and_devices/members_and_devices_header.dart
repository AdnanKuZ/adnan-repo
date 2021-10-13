import 'dart:convert';
import 'dart:js';

import 'package:admin/dialogs/add_device_dialog.dart';
import 'package:admin/dialogs/add_member_dialog.dart';
import 'package:admin/dialogs/loading_dialog.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/add_policy_provider.dart';
import 'package:admin/providers/add_device_provider.dart';
import 'package:admin/server/requests.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';
import 'package:admin/widgets/dashboard/dashboard_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class MembersAndDevicesHeader extends StatelessWidget {
  final bool showAddButton;
  final Function? onAddDeviceClicked;
  final Function? onAddMemberClicked;
  const MembersAndDevicesHeader(
      {required this.showAddButton,
      this.onAddDeviceClicked = null,
      this.onAddMemberClicked = null});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddPolicyProvider>(context, listen: false);
    var addDeviceProvider =
        Provider.of<AddDeviceProvider>(context, listen: false);

    return Column(
      children: [
        DashboardHeader(),
        DashboardTitle(
          title: 'Members And Devices',
          descriptions: 'Check your current members and devices configurations',
          showAddButton: showAddButton,
          onAddButtonClicked: () {
            showDialog(
                context: context,
                builder: (context) {
                  return new AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    content: Container(
                      width: 250,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          popUpDialogItem(Icons.people, 'New Member', () async {
                            Navigator.pop(context);
                            String result = await AddMemberDialog(
                                context: context, color: primaryColor);

                            if (result.isEmpty) {
                              return;
                            }

                            LoadingDialog(context: context);
                            bool response = await requestAddMember(result);
                            if (response) {
                              provider.addMember(
                                  MemberModel(name: result, devices: []));
                            }
                            Navigator.pop(context);
                            if (onAddMemberClicked != null) {
                              onAddMemberClicked!();
                            }
                          }),
                          popUpDialogItem(Icons.monitor_sharp, 'New Device',
                              () async {
                            Navigator.pop(context);
                            if (onAddDeviceClicked != null) {
                              onAddDeviceClicked!();
                            }
                          })
                        ],
                      ),
                    ),
                  );
                });
          },
        )
      ],
    );
  }

  Widget popUpDialogItem(IconData icon, String title, Function onClick) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        // color: Colo,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        icon,
                        // Icons.policy,
                        color: primaryColor,
                      ),
                    ),
                    Text(title, style: TextStyle(color: Colors.black))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
