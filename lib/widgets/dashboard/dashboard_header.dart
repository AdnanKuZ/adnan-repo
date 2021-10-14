import 'package:admin/dialogs/settings_dialog.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/metaDataProvider.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
              child: !Responsive.isMobile(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Consumer<MetadataProvider>(
                            builder: (context, state, child) => Wrap(
                              children: [
                                Text("Device Code: ${state.getmetadata["cpeIdentifier"]}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text("|",
                                      style: TextStyle(
                                        color: textGray,
                                        fontSize: 10,
                                      )),
                                ),
                                Text("Device Code: ${state.getmetadata["cpeIdentifier"]}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            color: Colors.black,
                            icon: Icon(Icons.settings),
                            onPressed: () {
                              SettingsDialog(context: context);
                            },
                            constraints: BoxConstraints()),
                      ],
                    )
                  : null),
        ],
      ),
    );
  }
}
