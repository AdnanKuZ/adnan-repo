import 'package:admin/models/app.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';

class Policy {
  final String? name;
  final List<Bandwidth>? bandwidths;
  final List<ConnectionType>? connectionTypes;
  final List<Member>? members;
  final List<App>? apps;

  Policy({
    this.name,
    this.bandwidths,
    this.connectionTypes,
    this.members,
    this.apps
  });
}

List<Policy> policiesTest = [
  Policy(
    name: "The Family", 
    bandwidths: [
      Bandwidth(bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM",day: 'Sun'),
      Bandwidth(bandwidth: "Small Bandwidth", date: "12:00 to 02:00 AM",day: 'Mon'),
      Bandwidth(bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM",day: 'Tue'),
      Bandwidth(bandwidth: "Full Bandwidth", date: "12:00 to 02:00 AM",day: 'Wed'),
      Bandwidth(bandwidth: "Blocked", date: "12:00 to 02:00 AM",day: 'Thu'),
      Bandwidth(bandwidth: "Blocked", date: "12:00 to 02:00 AM",day: 'Fri'),
      Bandwidth(bandwidth: "Blocked", date: "12:00 to 02:00 AM",day: 'Sat'),
    ],
    connectionTypes: [
      ConnectionType(type: 'Cabel', date: "12:00 to 02:00 AM" ,day: 'Sun'),
      ConnectionType(type: 'Cabel', date: "12:00 to 02:00 AM" ,day: 'Mon'),
      ConnectionType(type: 'LTE', date: "12:00 to 02:00 AM" ,day: 'Thu'),
    ],
    apps: [
      App(name: 'Chrome', image: ''),
      App(name: 'Edge', image: ''),
      App(name: 'Firefox', image: '')
    ],
    members: [
      Member(
        name: "Khalid Saied",
        devices: [
          Device(
            name: 'iPhone 12 ProMax',
            mac: '30-65-EC-6F-C4-58',
            ip: '192.168.1.1'
          ),
          Device(
            name: 'Lenovo Thinkpad',
            mac: '30-65-EC-6F-C4-58',
            ip: '192.168.1.1'
          )
        ]
      )
    ]
    ),

];
