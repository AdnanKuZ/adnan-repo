import 'package:admin/constants.dart';
import 'package:admin/dialogs/edit_device_dialog.dart';
import 'package:admin/dialogs/edit_member_dialog.dart';
import 'package:admin/dialogs/loading_dialog.dart';
import 'package:admin/providers/MembersAndDevicesStepProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/members_and_devices/members_and_devices_header.dart';
import 'package:admin/widgets/dashboard/members_and_devices/members_and_devices_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/server/requests.dart';
import 'package:provider/provider.dart';

class MembersAndDevicesScreen extends StatefulWidget {
  @override
  State<MembersAndDevicesScreen> createState() =>
      _MembersAndDevicesScreenState();
}

class _MembersAndDevicesScreenState extends State<MembersAndDevicesScreen> {
  bool initiated = false;

  Future<void> loadDevicesAndMembers() async {
    if (initiated) return;
    final provider =
        Provider.of<MembersAndDevicesStepProvider>(context, listen: false);
    List<DeviceModel> devices = await requestMappedDevices();
    List<MemberModel> members = await requestMappedMembers();

    provider.setDevices(devices);
    provider.setMembers(members);
    initiated = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
            Responsive.isMobile(context) ? 0 : menuPadding,
            defaultPadding,
            Responsive.isMobile(context) ? 0 : defaultPadding,
            0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: Responsive.isMobile(context)
                ? EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0)
                : EdgeInsets.all(0),
            child: MembersAndDevicesHeader(showAddButton: true),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  border: Border.all(
                    color: Color(0xFFFAFAFA),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: FutureBuilder(
                future: loadDevicesAndMembers(),
                builder: (context, snapshot) {
                  return Consumer<MembersAndDevicesStepProvider>(
                      builder: (context, state, child) {
                    return new StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(defaultPadding,
                          defaultPadding, defaultPadding, defaultPadding),
                      crossAxisCount: Responsive.is425to850(context)
                          ? 3
                          : Responsive.is425(context)
                              ? 1
                              : 3,
                      // Device and members length
                      itemCount: state.members.length + state.devices.length,
                      // Building item debending on item type
                      itemBuilder: (BuildContext context, int index) {
                        if (index < state.devices.length) {
                          return new Container(
                            child: DeviceWidget(
                              device: state.devices[index],
                              onDelete: (device) async {
                                LoadingDialog(context: context);
                                await requestDeleteDevice(device);
                                initiated = false;
                                await loadDevicesAndMembers();
                                Navigator.pop(context);
                              },
                              onEdit: (DeviceModel device) async {
                                var result = await EditDeviceDialog(
                                    context: context, color: primaryColor);
                                device.setName(result);

                                LoadingDialog(context: context);
                                await requestEditDevice(device);
                                initiated = false;
                                await loadDevicesAndMembers();
                                Navigator.pop(context);
                              },
                            ),
                          );
                        } else {
                          return new Container(
                              child: MemberWidget(
                                  member: state
                                      .members[index - state.devices.length],
                                  onDeleteMember: (member) async {
                                    LoadingDialog(context: context);
                                    await requestDeleteMember(member);
                                    initiated = false;
                                    await loadDevicesAndMembers();
                                    Navigator.pop(context);
                                  },
                                  onEditMember: (MemberModel member) async {
                                    var result = await EditMemberDialog(
                                        context: context, color: primaryColor);
                                    member.setName(result);
                                    LoadingDialog(context: context);
                                    await requestEditMember(member);
                                    initiated = false;
                                    await loadDevicesAndMembers();
                                    Navigator.pop(context);
                                  },
                                  onDeleteDevice: (device) async {
                                    LoadingDialog(context: context);
                                    await requestDeleteDevice(device);
                                    initiated = false;
                                    await loadDevicesAndMembers();
                                    Navigator.pop(context);
                                  },
                                  onEditDevice: (member, device) async {
                                    var result = await EditDeviceDialog(
                                        context: context, color: primaryColor);
                                    device.setName(result);
                                    LoadingDialog(context: context);
                                    await requestEditMemberDevice(member, device);
                                    initiated = false;
                                    await loadDevicesAndMembers();
                                    Navigator.pop(context);
                                  }));
                        }
                      },
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(1),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    );
                  });
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
