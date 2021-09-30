import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class PoliciesHeader extends StatelessWidget {
  final bool showAddButton;
  const PoliciesHeader(this.showAddButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      Text("Device Code: 9a8273d32",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text("|",
                            style: TextStyle(
                              color: textGray,
                              fontSize: 10,
                            )),
                      ),
                      Text("Device Code: 9a8273d32",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          )),
                    ],
                  ),
                ),
                IconButton(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    color: Colors.black,
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                    constraints: BoxConstraints()),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (!Responsive.isDesktop(context))
                          IconButton(
                              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              color: Colors.black,
                              icon: Icon(Icons.menu),
                              onPressed:
                                  context.read<MenuProvider>().controlMenu,
                              constraints: BoxConstraints()),
                        Text(
                          "Policies",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text("Check your ongoing policies and manage them!",
                        style: TextStyle(
                            fontSize: 10,
                            color: textGray,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              if (showAddButton)
                ElevatedButton.icon(
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
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Add New"),
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
