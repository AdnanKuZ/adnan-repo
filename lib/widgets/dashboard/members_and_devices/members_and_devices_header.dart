import 'package:admin/dialogs/add_device_dialog.dart';
import 'package:admin/dialogs/add_member_dialog.dart';
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
                          popUpDialogItem(Icons.people, 'New Member', () {
                            Navigator.pop(context);
                            AddMemberDialog(context: context,color: primaryColor);
                          }),
                          popUpDialogItem(Icons.monitor_sharp, 'New Device',
                              () {
                            Navigator.pop(context);
                            AddDeviceDialog(context: context,color: primaryColor);
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
