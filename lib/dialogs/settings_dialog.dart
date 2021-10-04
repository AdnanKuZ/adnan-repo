import 'package:admin/constants.dart';
import 'package:admin/enums/RouteEnum.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

SettingsDialog({required BuildContext context}) {
  Widget DialogItem(IconData icon, String title, Function onClick) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Color(0xFFFBFBFB),
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.policy,
                        color: primaryColor,
                      ),
                    ),
                    Text(title, style: TextStyle(color: Colors.black))
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Container(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DialogItem(Icons.policy, "Members & Devices", () {
                  Navigator.pop(context);
                  context
                      .read<MenuProvider>()
                      .setDashboardRoute(DashboardRoute.MembersAndDevices);
                }),
                DialogItem(
                    Icons.policy,
                    "Terms & Conditions",
                    () {
                      Navigator.pop(context);
                      context
                        .read<MenuProvider>()
                        .setDashboardRoute(DashboardRoute.TermsAndConditions);
                    }),
                DialogItem(Icons.policy, "Legal Statement", () {
                  Navigator.pop(context);
                  context
                      .read<MenuProvider>()
                      .setDashboardRoute(DashboardRoute.LegalStatement);
                }),
                DialogItem(Icons.policy, "Logout", () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        );
      });
}

AddMemberDialog(
    {required BuildContext context, required Function onAddClicked}) {
  showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Container(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'New Member Name',
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
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor, // background
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Add Member',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
