import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';
import 'package:admin/widgets/dashboard/dashboard_title.dart';
import 'package:admin/widgets/dashboard/policies/policy/seperator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class MemberWidget extends StatelessWidget {
  MemberModel member;
  final Function onDeleteMember;
  final Function onEditMember;
  final Function onDeleteDevice;
  final Function onEditDevice;

  MemberWidget({
    required this.member,
    required this.onDeleteMember,
    required this.onEditMember,
    required this.onDeleteDevice,
    required this.onEditDevice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color(0xFFFFFFFF),
          width: 1.0,
        ),
      ),
      color: Colors.white,
      shadowColor: Colors.black,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12.0, 20, 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    member.name == null ? 'undefined' : member.name!,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Wrap(
                    children: [
                      IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          color: lightGrayColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            onEditMember(member);
                          },
                          iconSize: 20,
                          constraints: BoxConstraints()),
                      IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          color: redColor,
                          icon: Icon(Icons.delete),
                          iconSize: 20,
                          onPressed: () {
                            onDeleteMember(member);
                          },
                          constraints: BoxConstraints()),
                    ],
                  )
                ],
              ),
              SeperatorWidget(),
              ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (_, index) {
                    return Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          member.devices![index].name!,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              color: textGray, fontWeight: FontWeight.w700),
                        ),
                        Wrap(
                          children: [
                            IconButton(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                color: lightGrayColor,
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  onEditDevice(member, member.devices![index]);
                                },
                                iconSize: 20,
                                constraints: BoxConstraints()),
                            IconButton(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                color: redColor,
                                icon: Icon(Icons.delete),
                                iconSize: 20,
                                onPressed: () {
                                  onDeleteDevice(member.devices![index]);
                                },
                                constraints: BoxConstraints()),
                          ],
                        )
                      ],
                    );
                  },
                  itemCount:
                      member.devices == null ? 0 : member.devices!.length)
            ],
          )),
    );
  }
}

class DeviceWidget extends StatelessWidget {
  final DeviceModel device;
  final Function onDelete;
  final Function onEdit;
  const DeviceWidget(
      {required this.device, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color(0xFFFFFFFF),
          width: 1.0,
        ),
      ),
      color: Colors.white,
      shadowColor: Colors.black,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12.0, 20, 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    device.name == null ? 'undefined' : device.name!,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: textGray, fontWeight: FontWeight.w700),
                  ),
                  Wrap(
                    children: [
                      IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          color: lightGrayColor,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            onEdit(device);
                          },
                          iconSize: 20,
                          constraints: BoxConstraints()),
                      IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          color: redColor,
                          icon: Icon(Icons.delete),
                          iconSize: 20,
                          onPressed: () {
                            onDelete(device);
                          },
                          constraints: BoxConstraints()),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
