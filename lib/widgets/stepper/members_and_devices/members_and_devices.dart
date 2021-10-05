import 'package:admin/constants.dart';
import 'package:admin/dialogs/add_member_dialog.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/MembersAndDevicesStepProvider.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/common/checkboxs.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';

import '../../../responsive.dart';

class MembersAndDevicesStepperWidget extends StatelessWidget {
  MembersAndDevicesStepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MembersAndDevicesStepProvider>(context, listen: false);
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
                    title: "Add New Device",
                    onPress: () {},
                  ),
                  Container(
                    width: 8,
                  ),
                  BorderButton(
                    title: "Add New Member",
                    onPress: () async {
                      String result = await AddMemberDialog(context: context);
                      provider.addMember(MemberModel(name: result, devices: []));
                      
                    },
                  ),
                  Container(
                    width: 8,
                  ),
                  FilledButton(
                    title: "Next Step",
                    onPress: () {
                      print("${stageProvider.stageIndex}");
                      stageProvider.setStageState = 1;
                      stageProvider.setStageIndex = stageProvider.stageIndex + 1;
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
    final provider = Provider.of<MembersAndDevicesStepProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Row(
              children: [
                Consumer<MembersAndDevicesStepProvider>(
                  builder: (context, instance, child) {
                    return StepperCheckbox(
                      isChecked: instance.getAreDevicesChecked,
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
        Consumer<MembersAndDevicesStepProvider>(
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

class StepperMemberList extends StatelessWidget {
  int gridIndex;
  MemberModel member;
  StepperMemberList({required this.gridIndex, required this.member, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MembersAndDevicesStepProvider>(context);

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
                Wrap(
                  children: [
                    Consumer<MembersAndDevicesStepProvider>(
                  builder: (context, instance, child) {
                    return StepperCheckbox(
                      isChecked: instance.areAllMemberDevicesChecked(gridIndex),
                      onChecked: (isChecked) {
                        provider.setAllMemberDevicesChecked(gridIndex, isChecked);
                      },
                    );
                  },
                ),
                Container(
                  width: 20,
                ),
                Text(
                  member.name.toString(),
                  style: TextStyle(color: Colors.black),
                )
                  ],
                ),
                RoundedAddButton(onClick: () {}, borderColor: primaryColor, iconColor: primaryColor,),
              ],
            ),
          ),
        ),
        Consumer<MembersAndDevicesStepProvider>(
          builder: (context, instance, child) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: instance.members[gridIndex].devices?.length,
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
                            isChecked: member.devices![index].isSelected,
                            onChecked: (isChecked) {
                              provider.setMemberDeviceChecked(gridIndex, index, isChecked);
                            },
                          ),
                          Container(
                            width: 20,
                          ),
                          Text(
                            instance.devices[index].name.toString(),
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
    final provider = Provider.of<MembersAndDevicesStepProvider>(context);

    return Consumer<MembersAndDevicesStepProvider>(
        builder: (context, instance, child) {
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
