import 'package:admin/dialogs/loading_dialog.dart';
import 'package:admin/models/app.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/providers/MembersAndDevicesStepProvider.dart';
import 'package:admin/providers/bandwidthProvider.dart';
import 'package:admin/providers/conncetionProvider.dart';
import 'package:admin/server/requests.dart';
import 'package:admin/widgets/dashboard/policies/policy/policy.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';

class LastStepWidget extends StatelessWidget {
  const LastStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stageProvider = Provider.of<StageProvider>(context);
    final memberAndDevicesProvider =
        Provider.of<MembersAndDevicesStepProvider>(context, listen: false);
    final bandwidthProvider =
        Provider.of<BandwidthProvider>(context, listen: false);
    final connectionProvider =
        Provider.of<ConnectionProvider>(context, listen: false);

    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    'What do you like to call this new policy ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    children: [
                      Consumer3<MembersAndDevicesStepProvider,
                              BandwidthProvider, ConnectionProvider>(
                          builder: (context, membersState, bandwidthState,
                              connectionState, child) {
                        return FilledButton(
                          title: "Confirm & Add Policy",
                          onPress: () async {
                            // Send policy to server
                            var policy = PolicyModel(
                              name: membersState.policyName,
                              bandwidths: [
                                ...bandwidthState.getBandwidthList()
                              ],
                              connectionTypes: [
                                ...connectionState.getConnectionTypesList()
                              ],
                              apps: [
                                ...membersState.getSelectedApps()
                              ],
                              members: [...membersState.getSelectedMemeber()],
                            );

                            LoadingDialog(context: context);
                            await requestAddPolicy(policy);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            stageProvider.setIsLastStep = false;
                          },
                        );
                      })
                    ],
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 400,
                child: Consumer3<MembersAndDevicesStepProvider,
                    BandwidthProvider, ConnectionProvider>(
                  builder: (context, membersState, bandwidthState,
                      connectionState, child) {
                    return PolicyWidget(
                        policy: PolicyModel(
                      name: membersState.policyName,
                      bandwidths: [...bandwidthState.getBandwidthList()],
                      connectionTypes: [
                        ...connectionState.getConnectionTypesList()
                      ],
                      apps: [
                        ...membersState.getSelectedApps()
                      ],
                      members: [...membersState.getSelectedMemeber()],
                    ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
