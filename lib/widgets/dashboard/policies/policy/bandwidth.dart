// Bandwidth limitations
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BandwidthLimitWidget extends StatelessWidget {
  final String days;
  final String type;
  final String time;

  const BandwidthLimitWidget(
      {required this.days, required this.type, required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(
            days,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Wrap(
            children: [
              Text(
                type,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.black),
              ),
              Text(
                " | ",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Color(0xFFD6D6D6)),
              ),
              Text(
                time,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Color(0xFFA5A5A5)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
