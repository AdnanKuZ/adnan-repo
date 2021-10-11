import 'package:admin/constants.dart';
import 'package:admin/providers/MembersAndDevicesStepProvider.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/stepper/bandwidth_row_widget.dart';

class BandwidthStepperWidget extends StatelessWidget {
  final BoxConstraints? constraints;
  BandwidthStepperWidget({Key? key, this.constraints}) : super(key: key);

  final lteController = TextEditingController();
  final cableController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StageProvider>(context, listen: false);
    final membersAdnDevicesProvider =
        Provider.of<MembersAndDevicesStepProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // constraints!.maxWidth > 860 ?
        Row(
          children: [
            Text(
              'Would you like to add any bandwidth limitaions for this policy ?',
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                // print(provider.stageIndex.toString());
                provider.setStageState = 1;
                provider.incrementIndex();
              },
              child: Text(
                'Next Step',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 70,
          child: Row(
            children: [
              Text(
                'Your internet provider speed ',
                // maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 220,
                child: CustomTextField(
                  suffix: Text('Kbps'),
                  controller: lteController,
                  keyboardType: TextInputType.number,
                  hintText: 'Bandwidth 0-1000',
                  onChanged: (value) {
                    membersAdnDevicesProvider.setCable(value);
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              BandwidthRowWidget(
                constraints: constraints,
                day: "All Days",
                title: 'All Days',
                allDays: true,
              ),
              BandwidthRowWidget(
                constraints: constraints,
                day: "Sunday",
                title: "Sunday",
                allDays: false,
              ),
              BandwidthRowWidget(
                constraints: constraints,
                day: "Monday",
                title: "Monday",
                allDays: false,
              ),
              BandwidthRowWidget(
                constraints: constraints,
                day: "Thursday",
                title: "Thursday",
                allDays: false,
              ),
              BandwidthRowWidget(
                constraints: constraints,
                day: "Wednsday",
                title: "Wednsday",
                allDays: false,
              ),
              BandwidthRowWidget(
                constraints: constraints,
                day: "Thursday",
                title: "Thursday",
                allDays: false,
              ),
              BandwidthRowWidget(
                constraints: constraints,
                day: "Friday",
                title: "Friday",
                allDays: false,
              ),
              BandwidthRowWidget(
                constraints: constraints,
                day: "Saturday",
                title: "Saturday",
                allDays: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
