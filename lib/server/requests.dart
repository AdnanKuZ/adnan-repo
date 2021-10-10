import 'dart:convert';
import 'package:admin/models/app.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/server/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Getting devices
Future<List<DeviceModel>> requestDevices() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  print(DEVICES_URL);
  http.Response response = await http.get(
    Uri.parse(DEVICES_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    },
  );

  print(response.body);
  if (response.statusCode == 200) {
    var devicesJson = jsonDecode(response.body) as List<dynamic>;
    List<DeviceModel> devices =
        devicesJson.map((item) => DeviceModel.fromJson(item)).toList();
    return devices;
  }

  return [];
}

// Request add policy
Future<bool> requestAddPolicy(
    PolicyModel policy, String lteBandwidth, String cableBandwidth) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  print('token ${token}');
  List<String?> devicesIds = [];
  List<String?> membersIds = [];
  List<String?> defaultApps = [];
  List<String?> customApps = [];
  print('members');

  // Members and devices
  for (MemberModel member in policy.members!) {
    print('member devices ${member.devices?.length}');
    var ids = member.devices?.map((value) => value.id).toList();
    print(member.name);
    print(ids);

    devicesIds.addAll(ids!);
    membersIds.add(member.id);
  }
  
  // General devices
  devicesIds.addAll(policy.devices!.where((element) => element.isSelected).map((e) => e.id).toList());

  print('apps');
  for (AppModel app in policy.apps!) {
    if (app.isPredefined) {
      defaultApps.add(app.name);
    } else {
      customApps.add(app.name);
    }
  }

  var bandwidths = [];
  print('bandwiths');
  for (BandwidthModel bandwidth in policy.bandwidths!) {
    print(bandwidth.date);

    if (bandwidth.day == 'All Days') {
      bandwidths.add({
        "value": -75687388.96878098,
        "schedule": {
          "day": 0,
          "allDays": true,
          "startTime": bandwidth.date!.replaceAll("From ", "").replaceAll(" To ", "-").split('-')[0].trim(),
          "endTime": bandwidth.date!.replaceAll("From ", "").replaceAll(" To ", "-")[1].trim(),
        }
      });
      break;
    }

    bandwidths.add({
      "value": -75687388.96878098,
      "schedule": {
        "day": bandwidth.getDayIndex(),
        "allDays": false,
        "startTime": bandwidth.date!.replaceAll("From ", "").replaceAll(" To ", "-").split('-')[0].trim(),
        "endTime": bandwidth.date!.replaceAll("From ", "").replaceAll(" To ", "-").split('-')[1].trim(),
      }
    });
  }
  print('connections');

  var connections = [];
  for (ConnectionTypeModel connectionType in policy.connectionTypes!) {
    print(connectionType.date);
    if (connectionType.day == 'All Days') {
      connections.add({
        "value": -75687388.96878098,
        "schedule": {
          "day": 0,
          "allDays": true,
          "startTime": connectionType.date!.replaceAll("From ", "").replaceAll(" To ", "-").split('-')[0].trim(),
          "endTime": connectionType.date!.replaceAll("From ", "").replaceAll(" To ", "-").split('-')[1].trim(),
        }
      });
      break;
    }

    connections.add({
      "value": -75687388.96878098,
      "schedule": {
        "day": connectionType.getDayIndex(),
        "allDays": false,
        "startTime": connectionType.date!.replaceAll("From ", "").replaceAll(" To ", "-").split('-')[0].trim(),
        "endTime": connectionType.date!.replaceAll("From ", "").replaceAll(" To ", "-").split('-')[1].trim(),
      }
    });
  }

  var body = {
    "userIds": [...membersIds],
    "deviceIds": [...devicesIds],
    "lteBandwidth": lteBandwidth.length == 0 ? 0 : int.parse(lteBandwidth),
    "cableBandwidth": cableBandwidth.length == 0 ? 0 : int.parse(cableBandwidth),
    "bandwidths": [...bandwidths],
    "interfaces": [...connections],
    'apps': [...defaultApps],
    'customApps': [...customApps]
  };

  print('userId: ${[...membersIds]}');
  print('deviceIds: ${[...devicesIds]}');
  print('lteBandwidth: ${lteBandwidth}');
  print('cableBandwidth: ${cableBandwidth}');
  print('bandwidths: ${[...bandwidths]}');
  print('interfaces: ${[...connections]}');
  print('apps: ${[...defaultApps]}');
  print('customApps: ${[...customApps]}');

  http.Response response = await http.post(Uri.parse(ADD_POLICY_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode(body));

  print('status code' + response.statusCode.toString());
  print('status body' + response.body.toString());

  if (response.statusCode == 201) {
    return true;
  }
  return false;
}

Future<bool> requestAddMember(String name) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  print(MEMBERS_URL);
  http.Response response = await http.post(Uri.parse(MEMBERS_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode({'name': name}));

  print('status code' + response.statusCode.toString());
  print('status body' + response.body.toString());

  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

// Getting members
Future<List<MemberModel>> requestMembers() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  http.Response response = await http.get(
    Uri.parse(MEMBERS_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    },
  );

  if (response.statusCode == 200) {
    var membersJson = jsonDecode(response.body) as List<dynamic>;
    List<MemberModel> members =
        membersJson.map((item) => MemberModel.fromJson(item)).toList();
    return members;
  }

  return [];
}

Future<bool> requestNewDevice(DeviceModel device) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  var body = device.member != null
      ? {
          "name": device.name,
          "member": {"id": device.member?.id}
        }
      : {"name": device.name};

  http.Response response = await http.post(Uri.parse(DEVICES_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode(body));

  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestExistingDevice(DeviceModel device) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  var body = (device.member != null)
      ? {
          "id": device.id,
          "name": device.name,
          "member": {"id": device.member?.id, "name": device.member?.name}
        }
      : {
          "id": device.id,
          "name": device.name,
        };

  http.Response response = await http.put(Uri.parse(DEVICES_URL + device.id!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode(body));

  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestDeleteDevice(DeviceModel device) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  http.Response response =
      await http.delete(Uri.parse(DEVICES_URL + device.id!), headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${token}',
  });

  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestDeleteMember(MemberModel member) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  print('url: ' + MEMBERS_URL + member.id!);
  http.Response response =
      await http.delete(Uri.parse(MEMBERS_URL + member.id!), headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${token}',
  });

  print('response status code: ' + response.statusCode.toString());
  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestEditMember(MemberModel member) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  print('url: ' + MEMBERS_URL + member.id!);
  http.Response response = await http.put(Uri.parse(MEMBERS_URL + member.id!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode({"id": member.id, "name": member.name}));

  print('response status code: ' + response.statusCode.toString());
  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestEditDevice(DeviceModel device) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  print('url: ' + DEVICES_URL + device.id!);
  http.Response response = await http.put(Uri.parse(DEVICES_URL + device.id!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode({"id": device.id, "name": device.name}));

  print('response status code: ' + response.statusCode.toString());
  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestEditMemberDevice(
    MemberModel member, DeviceModel device) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  print('url: ' + DEVICES_URL + device.id!);
  http.Response response = await http.put(Uri.parse(DEVICES_URL + device.id!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode({
        "id": device.id,
        "name": device.name,
        'member': {"id": member.id, "name": member.name}
      }));

  print('response status code: ' + response.statusCode.toString());
  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<List<DeviceModel>> requestMappedDevices() async {
  List<DeviceModel> devicesResponse = await requestDevices();
  List<DeviceModel> _devices = [];

  for (DeviceModel device in devicesResponse) {
    if (device.member == null) {
      _devices.add(device);
      continue;
    }
  }
  return _devices;
}

Future<List<MemberModel>> requestMappedMembers() async {
  List<DeviceModel> devicesResponse = await requestDevices();
  List<MemberModel> membersResponse = await requestMembers();

  for (DeviceModel device in devicesResponse) {
    if (device.member == null) {
      continue;
    }

    for (int i = 0; i < membersResponse.length; i++) {
      var member = membersResponse[i];
      if (device.member?.id == member.id) {
        if (member.devices == null) {
          member.devices = [];
        }
        member.devices?.add(device);
      }
    }
  }
  return membersResponse;
}
