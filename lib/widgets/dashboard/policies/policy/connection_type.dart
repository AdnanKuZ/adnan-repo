// Connection Types
import 'package:flutter/cupertino.dart';

import 'bandwidth.dart';

class ConnectionTypeWidget extends StatelessWidget {
  final String days;
  final String type;
  final String time;

  const ConnectionTypeWidget(
      {required this.days, required this.type, required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BandwidthLimitWidget(days: days, type: type, time: time);
  }
}