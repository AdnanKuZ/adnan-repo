import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/stepper/stepper_screen.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';
import 'package:admin/widgets/dashboard/dashboard_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class PoliciesHeader extends StatelessWidget {
  final bool showAddButton;
  const PoliciesHeader(
      {required this.showAddButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardHeader(),
        DashboardTitle(
          onAddButtonClicked: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => StepperScreen()));
          },
          title: 'Policies',
          descriptions: 'Check your ongoing policies and manage them!',
          showAddButton: showAddButton,)
      ],
    );
  }
}
