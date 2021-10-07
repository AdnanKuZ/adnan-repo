import 'package:admin/models/app.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';

class PolicyModel {
  final String name;
  final List<BandwidthModel>? bandwidths;
  final List<ConnectionTypeModel>? connectionTypes;
  final List<MemberModel>? members;
  final List<AppModel>? apps;

  PolicyModel(
      {required this.name,
      this.bandwidths,
      this.connectionTypes,
      this.members,
      this.apps});
}

List<PolicyModel> policiesTest = [
  PolicyModel(name: "Streaming Policy", bandwidths: [
    BandwidthModel(
        bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
    BandwidthModel(
        bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
    BandwidthModel(
        bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
    // BandwidthModel(
    //     bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
    // BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
    // BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
    // BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  ], connectionTypes: [
    ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
    ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
    ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  ], apps: [
    AppModel(name: 'Chrome', image: ''),
    AppModel(name: 'Edge', image: ''),
    AppModel(name: 'Firefox', image: '')
  ], members: [
    MemberModel(name: "Khalid Saied", devices: [
      DeviceModel(
          name: 'iPhone 12 ProMax',
          mac: '30-65-EC-6F-C4-58',
          ip: '192.168.1.1'),
      DeviceModel(
          name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
    ])
  ]),
  PolicyModel(name: "The Family", bandwidths: [
    BandwidthModel(
        bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
    BandwidthModel(
        bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
    BandwidthModel(
        bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
    BandwidthModel(
        bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
    BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
    BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
    BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  ], connectionTypes: [
    ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
    ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
    ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  ], apps: [
    AppModel(name: 'Chrome', image: ''),
    AppModel(name: 'Edge', image: ''),
    AppModel(name: 'Firefox', image: '')
  ], members: [
    MemberModel(name: "Khalid Saied", devices: [
      DeviceModel(
          name: 'iPhone 12 ProMax',
          mac: '30-65-EC-6F-C4-58',
          ip: '192.168.1.1'),
      DeviceModel(
          name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
    ])
  ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "The Family", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
  // PolicyModel(name: "Video Streaming", bandwidths: [
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Sun'),
  //   BandwidthModel(
  //       bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM", day: 'Mon'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Tue'),
  //   BandwidthModel(
  //       bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM", day: 'Wed'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Thu'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Fri'),
  //   BandwidthModel(bandwidth: "Blocked", date: "12:00 to 02:00 AM", day: 'Sat'),
  // ], connectionTypes: [
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Sun'),
  //   ConnectionTypeModel(type: 'Cabel', date: "12:00 to 02:00 AM", day: 'Mon'),
  //   ConnectionTypeModel(type: 'LTE', date: "12:00 to 02:00 AM", day: 'Thu'),
  // ], apps: [
  //   AppModel(name: 'Chrome', image: ''),
  //   AppModel(name: 'Edge', image: ''),
  //   AppModel(name: 'Firefox', image: '')
  // ], members: [
  //   MemberModel(name: "Khalid Saied", devices: [
  //     DeviceModel(
  //         name: 'iPhone 12 ProMax',
  //         mac: '30-65-EC-6F-C4-58',
  //         ip: '192.168.1.1'),
  //     DeviceModel(
  //         name: 'Lenovo Thinkpad', mac: '30-65-EC-6F-C4-58', ip: '192.168.1.1')
  //   ])
  // ]),
];
