import 'package:admin/constants.dart';
import 'package:admin/widgets/common/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/stepper/bandwidth/bandwidth_row_widget.dart';

class BandwidthStepperWidget extends StatelessWidget {
  const BandwidthStepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StageProvider>(context, listen: false);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
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
                      padding: EdgeInsets.symmetric(horizontal: 35,vertical: 18)),
                  onPressed: () {
                    print(provider.stageIndex.toString());
                    provider.setStageState = 2;
                    provider.setStageIndex = provider.stageIndex + 1;
                  },
                  child: Text(
                    'Next Step',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                BandwidthRowWidget(
                  title: 'All Days',
                  allDays: true,
                ),
                SizedBox(height: 30),
                BandwidthRowWidget(
                  title: "Sunday",
                  allDays: false,
                ),
                SizedBox(height: 30),
                BandwidthRowWidget(
                  title: "Sunday",
                  allDays: false,
                ),
                SizedBox(height: 30),
                BandwidthRowWidget(
                  title: "Sunday",
                  allDays: false,
                ),
                SizedBox(height: 30),
                BandwidthRowWidget(
                  title: "Sunday",
                  allDays: false,
                ),
                SizedBox(height: 30),
                BandwidthRowWidget(
                  title: "Sunday",
                  allDays: false,
                ),
                SizedBox(height: 30),
                BandwidthRowWidget(
                  title: "Sunday",
                  allDays: false,
                ),
                SizedBox(height: 30),
                BandwidthRowWidget(
                  title: "Sunday",
                  allDays: false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
