
class BandwidthModel {
  String? day;
  String? bandwidth;
  String? date;

  BandwidthModel({this.day, this.bandwidth, this.date});

  String getBandwidthName(int index) {
    switch (index) {
      case 3:
        return 'Full Bandwidth';
      case 2:
        return 'Medium Bandwidth';
      case 1:
        return 'Small Bandwidth';
      case 0:
        return 'Block';
    }
    return 'Block';
  }

  int getBandwidthIndex() {
    switch (bandwidth) {
      case 'Full Bandwidth':
        return 3;
      case 'Medium Bandwidth':
        return 2;
      case 'Small Bandwidth':
        return 1;
      case 'Block':
        return 0;
    }
    return 0;
  }

  int getDayIndex() {
    switch (day) {
      case 'Sun':
      case 'Sunday':
        return 0;
      case 'Mon':
      case 'Monday':
        return 1;
      case 'Tue':
      case 'Tuesday':
        return 2;
      case 'Wed':
      case 'Wednesday':
        return 3;
      case 'Thu':
      case 'Thursday':
        return 4;
      case 'Fri':
      case 'Friday':
        return 5;
      case 'Sat':
      case 'Saturday':
        return 6;
      default:
        return 0;
    }
  }
}
