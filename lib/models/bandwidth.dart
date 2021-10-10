import 'dart:ui';

class BandwidthModel {
  String? day;
  String? bandwidth;
  String? date;

  BandwidthModel({this.day, this.bandwidth, this.date});

  int getDayIndex() {
    switch (day) {
      case 'Sun':
        return 0;
      case 'Mon':
        return 1;
      case 'Tue':
        return 2;
      case 'Wed':
        return 3;
      case 'Thu':
        return 4;
      case 'Fri':
        return 5;
      default:
        return 0;
    }
  }
}
