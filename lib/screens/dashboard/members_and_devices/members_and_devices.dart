import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/members_and_devices/members_and_devices_header.dart';
import 'package:admin/widgets/dashboard/members_and_devices/members_and_devices_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MembersAndDevicesScreen extends StatefulWidget {
  @override
  State<MembersAndDevicesScreen> createState() =>
      _MembersAndDevicesScreenState();
}

class _MembersAndDevicesScreenState extends State<MembersAndDevicesScreen> {
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
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: Responsive.isMobile(context)
                ? EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0)
                : EdgeInsets.all(0),
            child: MembersAndDevicesHeader(showAddButton: true),
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
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) =>
                    new Container(child: DeviceWidget(title: "Device name",)),
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
