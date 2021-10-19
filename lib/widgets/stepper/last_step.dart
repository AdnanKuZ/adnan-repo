import 'package:admin/constants.dart';
import 'package:admin/dialogs/loading_dialog.dart';
import 'package:admin/models/app.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/providers/add_policy_provider.dart';
import 'package:admin/providers/appsProvider.dart';
import 'package:admin/providers/bandwidthProvider.dart';
import 'package:admin/providers/conncetionProvider.dart';
import 'package:admin/providers/policies_list_provider.dart';
import 'package:admin/server/requests.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:admin/widgets/dashboard/policies/policy/policy.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';

class LastStepWidget extends StatelessWidget {
  const LastStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stageProvider = Provider.of<StageProvider>(context, listen: false);
    final memberAndDevicesProvider =
        Provider.of<AddPolicyProvider>(context, listen: false);
    final policiesProvider =
        Provider.of<PoliciesListProvider>(context, listen: false);
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
                      Consumer4<AppsProvider, AddPolicyProvider,
                              BandwidthProvider, ConnectionProvider>(
                          builder: (context, appsState, membersState,
                              bandwidthState, connectionState, child) {
                        return CustomElevatedButton(
                          buttonColor: primaryColor,
                          splashColor: Colors.white,
                          textColor: Colors.white,
                          title: "Confirm & Add Policy",
                          onpressed: () async {
                            // Send policy to server
                            var policy = PolicyModel(
                                name: membersState.policyName,
                                bandwidths: [
                                  ...bandwidthState.getBandwidthList()
                                ],
                                connectionTypes: [
                                  ...connectionState.getConnectionTypesList()
                                ],
                                apps: [...appsState.getSelectedApps()],
                                members: !membersState.getAllDevicesChecked
                                    ? membersState.getSelectedMemeber()
                                    : [],
                                devices: !membersState.getAllDevicesChecked
                                    ? membersState.getSelectedDevices()
                                    : []);

                            LoadingDialog(context: context);
                            await requestAddPolicy(
                              policy,
                              memberAndDevicesProvider.cable,
                            );
                            var policies = await requestPolicies();
                            policiesProvider.setPolicies(policies);
                            Navigator.pop(context);
                            Navigator.pop(context);

                            stageProvider.setStagesStateFalse();
                            stageProvider.setIndex = 0;
                            stageProvider.setIsLastStep = false;
                            bandwidthProvider.abortBandwidth();
                            connectionProvider.abortconnection();
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
                child: Consumer4<AppsProvider, AddPolicyProvider,
                    BandwidthProvider, ConnectionProvider>(
                  builder: (context, appsState, membersState, bandwidthState,
                      connectionState, child) {
                    return PolicyWidget(
                        policy: PolicyModel(
                            userIds: [],
                            name: membersState.policyName,
                            bandwidths: [
                          ...bandwidthState.getBandwidthList()
                        ],
                            connectionTypes: [
                          ...connectionState.getConnectionTypesList()
                        ],
                            apps: [
                          ...appsState.getSelectedApps()
                        ],
                            members: [
                          ...membersState.getSelectedMemeber()
                        ],
                            devices: [
                          ...membersState.getSelectedDevices()
                        ]));
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
