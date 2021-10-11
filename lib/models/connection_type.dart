class ConnectionTypeModel {
  String? day;
  String? type;
  String? date;

  ConnectionTypeModel({
    this.day,
    this.type,
    this.date
  });

  int getBandwidthIndex() {
    switch (day) {
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