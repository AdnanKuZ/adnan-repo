import 'package:admin/constants.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/MembersAndDevicesStepProvider.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/common/checkboxs.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MembersAndDevicesStepperWidget extends StatelessWidget {
  MembersAndDevicesStepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    onPress: () {},
                  ),
                  Container(
                    width: 8,
                  ),
                  FilledButton(
                    title: "Next Step",
                    onPress: () {},
                  )
                ],
              )
            ],
          ),
          // Devices
          StepperDevicesList()
          // Members
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
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    StepperCheckbox(
                      isChecked: false,
                      onChecked: (isChecked) {},
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
              );
            }),
      ],
    );
  }
}
