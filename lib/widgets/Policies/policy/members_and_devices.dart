import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MembersAndDevicesWidget extends StatelessWidget {
  final Function onClick;

  const MembersAndDevicesWidget({required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFA5A5A5),
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0, 10.0, 0),
                      child: Icon(
                        Icons.devices_rounded,
                        size: 20,
                      ),
                    ),
                    Text(
                      "Members And Devices",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "Show All",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
