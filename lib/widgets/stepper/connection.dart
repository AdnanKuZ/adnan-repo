import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';
import 'package:admin/widgets/common/buttons.dart';
import 'package:admin/widgets/stepper/connection_row_widget.dart';

class ConnectionStepperWidget extends StatelessWidget {
  const ConnectionStepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StageProvider>(context, listen: false);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'What connection type you want to use for this policy ?',
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
                    padding: EdgeInsets.symmetric(horizontal: 35,vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
                  ),
                onPressed: () {
                  provider.setStageState = 2;
                  provider.incrementIndex();
                },
                child: Text(
                  'Next Step',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                ConnectionRowWidget(
                  day: "All Days",
                  title: 'All Days',
                  allDays: true,
                ),
                ConnectionRowWidget(
                  day: "Sunday",
                  title: "Sunday",
                  allDays: false,
                ),
                ConnectionRowWidget(
                  day: "Monday",
                  title: "Monday",
                  allDays: false,
                ),
                ConnectionRowWidget(
                  day: "Thursday",
                  title: "Thursday",
                  allDays: false,
                ),
                ConnectionRowWidget(
                  day: "Wednsday",
                  title: "Wednsday",
                  allDays: false,
                ),
                ConnectionRowWidget(
                  day: "Thursday",
                  title: "Thursday",
                  allDays: false,
                ),
                ConnectionRowWidget(
                  day: "Friday",
                  title: "Friday",
                  allDays: false,
                ),
                ConnectionRowWidget(
                  day: "Saturday",
                  title: "Saturday",
                  allDays: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
