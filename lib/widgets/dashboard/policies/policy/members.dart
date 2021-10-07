// Members
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class MembersWidget extends StatefulWidget {
  final MemberModel member;
  final Function onClick;
  const MembersWidget({required this.member, required this.onClick, Key? key})
      : super(key: key);
  @override
  State<MembersWidget> createState() => _MembersWidgetState();
}

class _MembersWidgetState extends State<MembersWidget> {
  bool _isOpen = true;

  void expand() {
    setState(() {
      _isOpen = true;
    });
  }

  void collapse() {
    setState(() {
      _isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Expandable(
          controller: ExpandableController(initialExpanded: _isOpen),
          collapsed: NestedCardHeader(
              title: widget.member.name!,
              isExpanded: _isOpen,
              onLayoutChanged: () => expand()),
          expanded: NestedCardBody(
            isExpanded: _isOpen,
            onLayoutChanged: () => collapse(),
            title: widget.member.name!,
            widgets: [
              MemberDeviceWidget(devices: widget.member.devices!)
            ],
          )),
    );
  }
}

class MemberDeviceWidget extends StatelessWidget {
  List<DeviceModel> devices;
  MemberDeviceWidget({required this.devices});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                              color: Color(0xFF95C93D), shape: BoxShape.circle),
                        ),
                        Text(
                          devices[index].name!,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "MAC: ",
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          devices[index].mac!,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.black),
                        ),
                      ],
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
