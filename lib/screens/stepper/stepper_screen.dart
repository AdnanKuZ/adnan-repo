import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/dialogs/loading_dialog.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/MembersAndDevicesStepProvider.dart';
import 'package:admin/server/requests.dart';
import 'package:admin/widgets/stepper/apps_step.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/stepper/members_and_devices/members_and_devices.dart';
import 'package:admin/widgets/stepper/bandwidth.dart';
import 'package:admin/widgets/stepper/policy_name/policy_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:admin/widgets/common/enhance_stepper.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';
import 'package:admin/widgets/stepper/connection.dart';

class StepperScreen extends StatefulWidget {
  StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  bool initiated = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!initiated) {
      //loadDevicesAndMembers();
      initiated = true;
    }
    super.didChangeDependencies();
  }

  Future<void> loadDevicesAndMembers() async {
    final provider = Provider.of<MembersAndDevicesStepProvider>(context);
    List<DeviceModel> devicesResponse = await requestDevices();
    List<MemberModel> membersResponse = await requestMembers();

    List<DeviceModel> _devices = [];

    for (DeviceModel device in devicesResponse) {
      if (device.member == null) {
        _devices.add(device);
        continue;
      }

      for (int i = 0; i < membersResponse.length; i++) {
        var member = membersResponse[i];
        if (device.member?.id == member.id) {
          if (member.devices == null) {
            member.devices = [];
          }
          member.devices?.add(device);
        }
      }
    }

    provider.setDevices(_devices);
    provider.setMembers(membersResponse);
    print(provider.members.length);
    print(provider.members[0].devices?.length.toString());
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final _stageProvider = Provider.of<StageProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: loadDevicesAndMembers(),
          builder: (cotnext, snapshot) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: constraints.maxWidth > 1008
                      ? EdgeInsets.symmetric(horizontal: 70)
                      : null,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.black87,
                                size: 22,
                              ),
                            ),
                            SizedBox(width: 13),
                            Text(
                              'Back to Dashboard',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.disabled_by_default_rounded,
                                color: Color(0xFFEEA3A3),
                                size: 45,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: primaryColor,
                              ),
                            ),
                            child: Consumer<StageProvider>(
                              builder: (context, instance, child) =>
                                  EnhanceStepper(
                                stepIconSize: 25,
                                type: StepperType.horizontal,
                                currentStep: instance.stageIndex,
                                physics: ScrollPhysics(),
                                controlsBuilder: (BuildContext context,
                                    {onStepContinue, onStepCancel}) {
                                  return Container();
                                },
                                onStepTapped: (int index) {
                                  if (instance.stageStates[index]) {
                                    _stageProvider.setIndex = index;
                                  }
                                  print(_stageProvider.stageIndex);
                                },
                                steps: [
                                  EnhanceStep(
                                      isActive: instance.stageStates[0]
                                          ? true
                                          : false,
                                      state: StepState.complete,
                                      title: Text(
                                        constraints.maxWidth > 1008
                                            ? ' Members & Devices   '
                                            : '',
                                        style: TextStyle(
                                            color: instance.stageStates[0]
                                                ? primaryColor
                                                : Colors.grey),
                                      ),
                                      content: Container(
                                        child: Column(
                                          children: [
                                            MembersAndDevicesStepperWidget()
                                          ],
                                        ),
                                      )),
                                  EnhanceStep(
                                      isActive: instance.stageStates[1]
                                          ? true
                                          : false,
                                      state: StepState.complete,
                                      title: Text(
                                        constraints.maxWidth > 1008
                                            ? ' Bandwidth   '
                                            : '',
                                        style: TextStyle(
                                            color: instance.stageStates[1]
                                                ? primaryColor
                                                : Colors.grey),
                                      ),
                                      content: Container(
                                        child: Column(
                                          children: [
                                            BandwidthStepperWidget(
                                              constraints: constraints,
                                            )
                                          ],
                                        ),
                                      )),
                                  EnhanceStep(
                                      isActive: instance.stageStates[2]
                                          ? true
                                          : false,
                                      state: StepState.complete,
                                      title: Text(
                                        constraints.maxWidth > 1008
                                            ? ' Connection   '
                                            : '',
                                        style: TextStyle(
                                            color: instance.stageStates[2]
                                                ? primaryColor
                                                : Colors.grey),
                                      ),
                                      content: Container(
                                          child:
                                              ConnectionStepperWidget())),
                                  EnhanceStep(
                                      isActive: instance.stageStates[3]
                                          ? true
                                          : false,
                                      state: StepState.complete,
                                      title: Text(
                                        constraints.maxWidth > 1008
                                            ? ' Apps   '
                                            : '',
                                        style: TextStyle(
                                            color: instance.stageStates[3]
                                                ? primaryColor
                                                : Colors.grey),
                                      ),
                                      content: Container(
                                        child: AppsStepScreen(),
                                      )),
                                  EnhanceStep(
                                      isActive: instance.stageStates[4]
                                          ? true
                                          : false,
                                      state: StepState.complete,
                                      title: Text(
                                        constraints.maxWidth > 1008
                                            ? ' Policy Name   '
                                            : '',
                                        style: TextStyle(
                                            color: instance.stageStates[4]
                                                ? primaryColor
                                                : Colors.grey),
                                      ),
                                      content: PolicyNameStepWidget())
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
