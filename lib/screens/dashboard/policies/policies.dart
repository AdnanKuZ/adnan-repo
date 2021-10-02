import 'package:admin/constants.dart';
import 'package:admin/widgets/Policies/policies_body.dart';
import 'package:admin/widgets/Policies/policies_header.dart';
import 'package:admin/widgets/Policies/policy_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../responsive.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: PoliciesFilledScreen());
  }
}

class PoliciesEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.fromLTRB(menuPadding, defaultPadding, defaultPadding, 0),
      child: Column(
        children: [
          PoliciesHeader(false),
          Expanded(child: Container(child: PoliciesEmptyBody()))
        ],
      ),
    );
  }
}

class PoliciesFilledScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.fromLTRB(menuPadding, defaultPadding, defaultPadding, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PoliciesHeader(true),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                border: Border.all(
                  color: Color(0xFFFAFAFA),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: new StaggeredGridView.countBuilder(
              padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding,
                  defaultPadding, defaultPadding),
              crossAxisCount: 9,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) =>
                  new Container(child: PolicyWidget()),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          ),
        )
      ]),
    );
  }
}