import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/dialogs/add_device_dialog.dart';
import 'package:admin/dialogs/add_member_dialog.dart';
import 'package:admin/dialogs/auth_error_dialog.dart';
import 'package:admin/dialogs/edit_member_dialog.dart';
import 'package:admin/dialogs/loading_dialog.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/add_policy_provider.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/add_device_provider.dart';
import 'package:admin/server/requests.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/common/checkboxs.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';
import '../../../responsive.dart';

void showAssociateDialog(context, AddDeviceProvider deviceProvider,
    AddPolicyProvider policyProvider, MemberModel? member) async {
  // Showing loading dialog
  LoadingDialog(context: context);
  // Requesting devices
  var devicesResponse = await requestDevices();
  // Setting devices in provider
  List<DeviceModel> filteredDevices = [];
  for (DeviceModel device in devicesResponse) {
    if (device.member == null) filteredDevices.add(device);
  }
  deviceProvider.setDevices(filteredDevices);
  // Requesting memebers
  var membersResponse = await requestMembers();
  print(membersResponse.toString());
  // Setting members in provider
  deviceProvider.setMembers(membersResponse);
  // Hiding loading dialog
  Navigator.pop(context);
  // Showing add device dialog
  DeviceModel result =
      await AddDeviceDialog(context: context, selectedMember: member);

  // Showing loading dialog
  LoadingDialog(context: context);

  print('payload: ' + jsonEncode(result).toString());
  if (result.id != null) {
    // Device already exist
    await requestExistingDevice(result);
  } else {
    // Device does not exist
    await requestNewDevice(result);
  }

  // Requesting devices and members
  List<DeviceModel> devices = await requestMappedDevices();
  List<MemberModel> members = await requestMappedMembers();

  policyProvider.setDevices(devices);
  policyProvider.setMembers(members);
  // Hiding loading dialog
  Navigator.pop(context);
}

void reloadMembersAndDevices(
    BuildContext context, AddPolicyProvider policyProvider) async {
  // Showing loading dialog
  LoadingDialog(context: context);

  // Requesting devices and members
  List<DeviceModel> devices = await requestMappedDevices();
  List<MemberModel> members = await requestMappedMembers();

  policyProvider.setDevices(devices);
  policyProvider.setMembers(members);
  
  // Hiding loading dialog
  Navigator.pop(context);
}

class MembersAndDevicesStepperWidget extends StatelessWidget {
  MembersAndDevicesStepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPolicyProvider>(context, listen: false);
    final addDeviceProvider =
        Provider.of<AddDeviceProvider>(context, listen: false);
    final stageProvider = Provider.of<StageProvider>(context, listen: false);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              AutoSizeText(
                'Let\'s select members and devices for this policy',
                maxLines: 1,
                maxFontSize: 20,
                minFontSize: 13,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: [
                  BorderButton(
                    title: "Associate",
                    icon: Icons.add,
                    onPress: () async {
                      showAssociateDialog(
                          context, addDeviceProvider, provider, null);
                    },
                  ),
                  Container(
                    width: 8,
                  ),
                  BorderButton(
                    title: "Add New Member",
                    icon: Icons.add,
                    onPress: () async {
                      String result = await AddMemberDialog(context: context);
                      LoadingDialog(context: context);
                      bool response = await requestAddMember(result);
                      if (response) {
                        provider
                            .addMember(MemberModel(name: result, devices: []));
                      }
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    width: 8,
                  ),
                  BorderButton(
                    title: "Refresh",
                    icon: Icons.add,
                    onPress: () {
                      reloadMembersAndDevices(context, provider);
                    },
                  ),
                  Container(
                    width: 8,
                  ),
                  FilledButton(
                    title: "Next Step",
                    onPress: () {
                      if (!provider.isMembersAndDevicesStepValid()) {
                        showDialog(
                            context: context,
                            builder: (context) => AuthDialog(
                                  title: "Please Select at least one device.",
                                ));
                        print('step invalid');
                        return;
                      }

                      print("${stageProvider.stageIndex}");
                      stageProvider.setStageState = 0;
                      stageProvider.incrementIndex();
                      print("${stageProvider.stageIndex}");
                    },
                  )
                ],
              )
            ],
          ),
          // Devices
          StepperDevicesList(),
          // Members
          StepperMembersGrid()
        ],
      ),
    );
  }
}

class StepperDevicesList extends StatelessWidget {
  const StepperDevicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPolicyProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Row(
              children: [
                Consumer<AddPolicyProvider>(
                  builder: (context, instance, child) {
                    return StepperCheckbox(
                      isChecked: instance.getAllDevicesChecked,
                      onChecked: (isChecked) {
                        provider.setAllDevicesChecked(isChecked);
                      },
                    );
                  },
                ),
                Container(
                  width: 20,
                ),
                Text(
                  "Select All Devices",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Consumer<AddPolicyProvider>(
          builder: (context, instance, child) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: instance.devices.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 4),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: lightGrayColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          StepperCheckbox(
                            disabled: instance.getAllDevicesChecked,
                            isChecked: instance.devices[index].isSelected,
                            onChecked: (isChecked) {
                              provider.setDeviceChecked(index, isChecked);
                            },
                          ),
                          Container(
                            width: 20,
                          ),
                          Text(
                            instance.devices[index].name.toString(),
                            style: TextStyle(
                                color: instance.getAllDevicesChecked
                                    ? textGray
                                    : Colors.black),
                          )
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
}

class StepperMemberList extends StatelessWidget {
  int gridIndex;
  MemberModel member;
  StepperMemberList({required this.gridIndex, required this.member, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addDeviceProvider =
        Provider.of<AddDeviceProvider>(context, listen: false);
    final provider = Provider.of<AddPolicyProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Consumer<AddPolicyProvider>(
                    builder: (context, instance, child) {
                  return Wrap(
                    children: [
                      StepperCheckbox(
                        disabled: instance.getAllDevicesChecked,
                        isChecked:
                            instance.areAllMemberDevicesChecked(gridIndex),
                        onChecked: (isChecked) {
                          provider.setAllMemberDevicesChecked(
                              gridIndex, isChecked);
                        },
                      ),
                      Container(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.getName(),
                            style: TextStyle(
                                color: instance.getAllDevicesChecked
                                    ? textGray
                                    : Colors.black),
                          ),
                          if (member.getDevices().length == 0)
                            Text(
                              'No devices',
                              style: TextStyle(color: Colors.grey),
                            )
                        ],
                      )
                    ],
                  );
                }),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.edit,
                        color: lightGrayColor,
                      ),
                      onTap: () async {
                        var result = await EditMemberDialog(
                            context: context, color: primaryColor);
                        member.setName(result);
                        LoadingDialog(context: context);
                        await requestEditMember(member);
                        List<DeviceModel> devices =
                            await requestMappedDevices();
                        List<MemberModel> members =
                            await requestMappedMembers();

                        provider.setDevices(devices);
                        provider.setMembers(members);
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 13),
                    RoundedAddButton(
                      onClick: () {
                        showAssociateDialog(
                            context, addDeviceProvider, provider, member);
                      },
                      borderColor: primaryColor,
                      iconColor: primaryColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Consumer<AddPolicyProvider>(
          builder: (context, instance, child) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: instance.members[gridIndex].getDevices().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 4),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: lightGrayColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          StepperCheckbox(
                            disabled: instance.getAllDevicesChecked,
                            isChecked: member.devices![index].isSelected,
                            onChecked: (isChecked) {
                              provider.setMemberDeviceChecked(
                                  gridIndex, index, isChecked);
                            },
                          ),
                          Container(
                            width: 20,
                          ),
                          Text(
                            instance.members[gridIndex].devices![index].name!,
                            style: TextStyle(color: Colors.black),
                          )
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
}

class StepperMembersGrid extends StatelessWidget {
  const StepperMembersGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPolicyProvider>(context);

    return Consumer<AddPolicyProvider>(builder: (context, instance, child) {
      return new StaggeredGridView.countBuilder(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(0, defaultPadding, 0, 0),
        crossAxisCount: Responsive.is425to850(context)
            ? 3
            : Responsive.is425(context)
                ? 1
                : 3,
        itemCount: instance.members.length,
        itemBuilder: (BuildContext context, int index) => new Container(
          child: StepperMemberList(
            gridIndex: index,
            member: instance.members[index],
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
        mainAxisSpacing: 18.0,
        crossAxisSpacing: 8.0,
      );
    });
  }
}
