import 'package:admin/constants.dart';
import 'package:admin/dialogs/add_member_dialog.dart';
import 'package:admin/dialogs/auth_error_dialog.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/add_policy_provider.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/appsProvider.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/common/checkboxs.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';

import '../../../responsive.dart';

class PolicyNameStepWidget extends StatelessWidget {
  final String value = '';
  final GlobalKey<FormState> formKey;
  PolicyNameStepWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stageProvider = Provider.of<StageProvider>(context, listen: false);
    final policyProvider =
        Provider.of<AddPolicyProvider>(context, listen: false);
    final textFieldController = TextEditingController();
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
                      CustomElevatedButton(
                        buttonColor: primaryColor,
                        splashColor: Colors.white,
                        textColor: Colors.white,
                        title: "Proceed to Summary",
                        onpressed: () {
                          if (!formKey.currentState!.validate()) {
                            AuthDialog(
                              title: 'Please enter device name.',
                            );
                            return;
                          }

                          stageProvider.setIsLastStep = true;
                          stageProvider.setStageState = 4;
                          stageProvider.setIsLastStep = true;
                          policyProvider
                              .setPolicyName(textFieldController.text);
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
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: textFieldController,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'New Policy Name',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
