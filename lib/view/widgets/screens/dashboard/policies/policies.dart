import 'package:admin/constants.dart';
import 'package:admin/widgets/Policies/policies_body.dart';
import 'package:admin/widgets/Policies/policies_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PoliciesFilledScreen()
    );
  }
}


class PoliciesEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(
            menuPadding, defaultPadding, defaultPadding, 0),
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
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(
              menuPadding, defaultPadding, defaultPadding, 0),
          child: Column(
            children: [
              PoliciesHeader(true),
              PoliciesFilledBody()
            ],
          ),
        ),
    );
  }
}


