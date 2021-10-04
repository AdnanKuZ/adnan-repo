import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';
import 'package:admin/widgets/dashboard/dashboard_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class MemberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class DeviceWidget extends StatelessWidget {
  final String title;
  const DeviceWidget({required this.title});

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
                    title,
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
                            //onEdit();
                          },
                          iconSize: 20,
                          constraints: BoxConstraints()),
                      IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          color: redColor,
                          icon: Icon(Icons.delete),
                          iconSize: 20,
                          onPressed: () {
                            //onDelete();
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
