import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class DashboardTitle extends StatelessWidget {
  final String title;
  final String descriptions;
  final bool showAddButton;
  final Function? onAddButtonClicked;
  const DashboardTitle(
      {required this.title,
      required this.descriptions,
      this.showAddButton = false,
      this.onAddButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // context.read<MenuProvider>().controlMenu
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(descriptions,
                      style: TextStyle(
                          fontSize: 10,
                          color: textGray,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              if (showAddButton)
                (!Responsive.isMobile(context))
                    ? ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding /
                                (Responsive.isMobile(context) ? 1 : 1),
                          ),
                        ),
                        onPressed: () {
                          onAddButtonClicked!();
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add New"),
                      )
                    : Container(
                      height: 35,
                      width: 35,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: lightGrayColor,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8))),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
