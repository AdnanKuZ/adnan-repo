import 'package:admin/constants.dart';
import 'package:admin/dialogs/settings_dialog.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/Policies/policies_body.dart';
import 'package:admin/widgets/Policies/policies_header.dart';
import 'package:admin/widgets/policies/policy/policy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: PoliciesFilledScreen(policies: [...policiesTest]));
    //return SafeArea(child: PoliciesEmptyScreen());
  }
}

class PoliciesEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          Responsive.isMobile(context) ? defaultPadding : menuPadding,
          defaultPadding,
          defaultPadding,
          0),
      child: Column(
        children: [
          PoliciesHeader(
              showAddButton: false,
              onSettingsPressed: () {
                SettingsDialog(context: context);
              }),
          Expanded(child: Container(child: PoliciesEmptyBody()))
        ],
      ),
    );
  }
}

class PoliciesFilledScreen extends StatelessWidget {
  final List<PolicyModel> policies;

  const PoliciesFilledScreen({required this.policies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
            Responsive.isMobile(context) ? 0 : menuPadding,
            defaultPadding,
            Responsive.isMobile(context) ? 0 : defaultPadding,
            0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: Responsive.isMobile(context)
                ? EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0)
                : EdgeInsets.all(0),
            child: PoliciesHeader(
                showAddButton: true,
                onSettingsPressed: () {
                  SettingsDialog(context: context);
                }),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  border: Border.all(
                    color: Color(0xFFFAFAFA),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: new StaggeredGridView.countBuilder(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding,
                    defaultPadding, defaultPadding),
                crossAxisCount: Responsive.is425to850(context)
                    ? 3
                    : Responsive.is425(context)
                        ? 1
                        : 3,
                itemCount: policies.length,
                itemBuilder: (BuildContext context, int index) => new Container(
                    child: PolicyWidget(
                  policy: policies[index],
                )),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
