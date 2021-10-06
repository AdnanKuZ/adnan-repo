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

class PolicyNameStepWidget extends StatelessWidget {
  PolicyNameStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<MembersAndDevicesStepProvider>(context, listen: false);
    final stageProvider = Provider.of<StageProvider>(context, listen: false);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'What do you like to call this new policy ?',
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
                      FilledButton(
                        title: "Next Step",
                        onPress: () {
                          stageProvider.setStageState = 4;
                        },
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'New Member Name',
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onFieldSubmitted: (value) {},
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
