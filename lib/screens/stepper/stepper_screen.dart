import 'package:admin/constants.dart';
import 'package:admin/widgets/stepper/members_and_devices.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:admin/widgets/common/enhance_stepper.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';

class StepperScreen extends StatefulWidget {
  StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  @override
  Widget build(BuildContext context) {
    final _stageProvider = Provider.of<StageProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black87,
                      size: 22,
                    ),
                    SizedBox(width: 13),
                    Text(
                      'Back to Dashboard',
                      style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.disabled_by_default_rounded,
                      color: Color(0xFFEEA3A3),
                      size: 45,
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
                      builder: (context, instance, child) => EnhanceStepper(
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
                            _stageProvider.setStageIndex = index;
                          }
                        },
                        steps: [
                          EnhanceStep(
                              isActive: instance.stageStates[0] ? true : false,
                              state: StepState.complete,
                              title: Text(
                                ' Members & Devices   ',
                                style: TextStyle(
                                    color: instance.stageStates[0]
                                        ? primaryColor
                                        : Colors.grey),
                              ),
                              content: Container(
                                margin: EdgeInsets.symmetric(horizontal: 56),
                                child: Column(
                                  children: [
                                    StepperUpperWidget(index: 1,),
                                  ],
                                ),
                              )),
                          EnhanceStep(
                              isActive: instance.stageStates[1] ? true : false,
                              state: StepState.complete,
                              title: Text(
                                ' Bandwidth   ',
                                style: TextStyle(
                                    color: instance.stageStates[1]
                                        ? primaryColor
                                        : Colors.grey),
                              ),
                              content: Container(
                                margin: EdgeInsets.symmetric(horizontal: 56),
                                child: Column(
                                  children: [
                                    StepperUpperWidget(index: 2)
                                  ],
                                ),
                              )),
                          EnhanceStep(
                              isActive: instance.stageStates[2] ? true : false,
                              state: StepState.complete,
                              title: Text(
                                ' Connection   ',
                                style: TextStyle(
                                    color: instance.stageStates[2]
                                        ? primaryColor
                                        : Colors.grey),
                              ),
                              content: Container(
                                margin: EdgeInsets.symmetric(horizontal: 56),
                                child: Column(
                                  children: [
                                    StepperUpperWidget(index: 3)
                                  ],
                                ),
                              )),
                          EnhanceStep(
                              isActive: instance.stageStates[3] ? true : false,
                              state: StepState.complete,
                              title: Text(
                                ' Apps   ',
                                style: TextStyle(
                                    color: instance.stageStates[3]
                                        ? primaryColor
                                        : Colors.grey),
                              ),
                              content: Container(
                                margin: EdgeInsets.symmetric(horizontal: 56),
                                child: Column(
                                  children: [
                                    StepperUpperWidget(index: 4)
                                  ],
                                ),
                              )),
                          EnhanceStep(
                              isActive: instance.stageStates[4] ? true : false,
                              state: StepState.complete,
                              title: Text(
                                ' Policy name  ',
                                style: TextStyle(
                                    color: instance.stageStates[4]
                                        ? primaryColor
                                        : Colors.grey),
                              ),
                              content: Container(
                                margin: EdgeInsets.symmetric(horizontal: 56),
                                child: Column(
                                  children: [
                                    StepperUpperWidget(index: 5)
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class StepperUpperWidget extends StatelessWidget {
  final int index;
  const StepperUpperWidget({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StageProvider>(context, listen: false);
    return Container(
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutoSizeText(
            'Let\'s select members and devices for this policy' +
                index.toString(),
            maxLines: 1,
            maxFontSize: 22,
            minFontSize: 13,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          Spacer(),
          Column(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 30)),
                  onPressed: () {
                    print(provider.stageIndex.toString());
                    provider.setStageState = index;
                    provider.setStageIndex = provider.stageIndex + 1;
                  },
                  child: Text(
                    'Next Step',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );;
  }
}
