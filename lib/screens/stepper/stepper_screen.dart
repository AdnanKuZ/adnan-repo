import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StepperScreen extends StatefulWidget {
  StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int stepperIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Container(
          color: Colors.amber,
          child: Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 70),
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      // FontAwesomeIcons.arrowLeft,
                      Icons.arrow_back_sharp,
                      color: Colors.black87,
                      size: 22,
                    ),
                    SizedBox(width: 13),
                    Text(
                      'Back to Dashboard',
                      style: TextStyle(color: Colors.black87, fontSize: 13),
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
                child: Stepper(
                  currentStep: stepperIndex,
                  onStepCancel: () {
                    if (stepperIndex > 0) {
                      setState(() {
                        stepperIndex -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (stepperIndex <= 0) {
                      setState(() {
                        stepperIndex += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      stepperIndex = index;
                    });
                  },
                  type: StepperType.vertical,
                  steps: [
                    Step(
                        title: Text('first step'),
                        content: Container(
                          child: Text('1'),
                          color: Colors.black12,
                        )),
                    Step(
                        title: Text('second step'),
                        content: Container(
                          child: Text('2'),
                          color: Colors.black12,
                        )),
                    Step(
                        title: Text('third step'),
                        content: Container(
                          child: Text('3'),
                          color: Colors.black12,
                        )),
                    Step(
                        title: Text('fourth step'),
                        content: Container(
                          child: Text('4'),
                          color: Colors.black12,
                        )),
                    Step(
                        title: Text('fifth step'),
                        content: Container(
                          child: Text('5'),
                          color: Colors.black12,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
