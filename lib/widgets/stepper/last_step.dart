import 'package:admin/models/app.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/models/policy.dart';
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
                      FilledButton(
                        title: "Confirm & Add Policy",
                        onPress: () {
                          Navigator.pop(context);
                          stageProvider.setIsLastStep = false;
                        },
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          PolicyWidget(
              policy: PolicyModel(name: 'Boys & Girls', bandwidths: [
            BandwidthModel(
                bandwidth: 'Full Bandwidth',
                day: 'All Days',
                date: '12:00 to 02:00 AM')
          ], connectionTypes: [
            ConnectionTypeModel(
                type: "Cable", day: 'All Days', date: '12:00 to 02:00 AM')
          ], apps: [
            AppModel(
              name: "Chrome",
              image: "assets/images/chrome.png",
              link: '',
            )
          ], members: [
            MemberModel(
                name: "Khalid Saled",
                devices: [DeviceModel(name: 'IPhone 12 ProMax', mac: 'MA: 5:E5:49:AC:07:44',)],),
          ],
          ))
        ],
      ),
    );
  }
}
