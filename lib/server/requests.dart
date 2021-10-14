import 'dart:convert';
import 'package:admin/models/app.dart';
import 'package:admin/models/application.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/models/metadata.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/models/policy_list.dart';
import 'package:admin/server/urls.dart';
import 'package:admin/widgets/stepper/connection.dart';
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
Future<bool> requestAddPolicy(PolicyModel policy, String cableBandwidth) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  List<String?> devicesIds = [];
  List<String?> membersIds = [];
  List<String?> defaultApps = [];
  List<String?> customApps = [];

  // Members and devices
  for (MemberModel member in policy.members!) {
    var ids = member.devices?.map((value) => value.id).toList();
    devicesIds.addAll(ids!);
    membersIds.add(member.id);
  }

  // General devices
  devicesIds.addAll(policy.devices!
      .where((element) => element.isSelected)
      .map((e) => e.id)
      .toList());
  for (AppModel app in policy.apps!) {
    if (app.isPredefined) {
      defaultApps.add(app.title);
    } else {
      customApps.add(app.title);
    }
  }
  print('apps done');

  var bandwidths = [];
  for (BandwidthModel bandwidth in policy.bandwidths!) {
    if (bandwidth.day == 'All Days') {
      bandwidths.add({
        "value": bandwidth.getBandwidthIndex(),
        "schedule": {
          "day": 0,
          "allDays": true,
          "startTime": bandwidth.date!
              .replaceAll("From ", "")
              .replaceAll(" To ", "-")
              .split('-')[0]
              .trim(),
          "endTime": bandwidth.date!
              .replaceAll("From ", "")
              .replaceAll(" To ", "-")[1]
              .trim(),
        }
      });
      break;
    }

    bandwidths.add({
      "value": bandwidth.getBandwidthIndex(),
      "schedule": {
        "day": bandwidth.getDayIndex(),
        "allDays": false,
        "startTime": bandwidth.date!
            .replaceAll("From ", "")
            .replaceAll(" To ", "-")
            .split('-')[0]
            .trim(),
        "endTime": bandwidth.date!
            .replaceAll("From ", "")
            .replaceAll(" To ", "-")
            .split('-')[1]
            .trim(),
      }
    });
  }
  print('bandwidth done');

  var connections = [];
  for (ConnectionTypeModel connectionType in policy.connectionTypes!) {
    print(connectionType.date);
    if (connectionType.day == 'All Days') {
      connections.add({
        "portName": connectionType.port?.name,
        "schedule": {
          "day": 0,
          "allDays": true,
          "startTime": connectionType.date!
              .replaceAll("From ", "")
              .replaceAll(" To ", "-")
              .split('-')[0]
              .trim(),
          "endTime": connectionType.date!
              .replaceAll("From ", "")
              .replaceAll(" To ", "-")
              .split('-')[1]
              .trim(),
        }
      });
      break;
    }

    connections.add({
      "portName": connectionType.port?.name,
      "schedule": {
        "day": connectionType.getDayIndex(),
        "allDays": false,
        "startTime": connectionType.date!
            .replaceAll("From ", "")
            .replaceAll(" To ", "-")
            .split('-')[0]
            .trim(),
        "endTime": connectionType.date!
            .replaceAll("From ", "")
            .replaceAll(" To ", "-")
            .split('-')[1]
            .trim(),
      }
    });
  }
  print('connections done');

  var body = {
    "title": policy.name,
    "userIds": [...membersIds],
    "deviceMacAddresses": [...devicesIds],
    "cableBandwidth":
        cableBandwidth.length == 0 ? 0 : int.parse(cableBandwidth),
    "bandwidths": [...bandwidths],
    "interfaces": [...connections],
    'apps': [...defaultApps],
    'customApps': [...customApps]
  };

  print('title: ${policy.name}');
  print('userId: ${[...membersIds]}');
  print('deviceMacAddresses: ${[...devicesIds]}');
  // print('lteBandwidth: ${lteBandwidth}');
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

  print(DEVICES_URL);
  print(body);

  http.Response response = await http.post(Uri.parse(DEVICES_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode(body));

  print('response: ' + response.body);
  print('status: ' + response.statusCode.toString());
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
          "macAddress": device.id,
          "name": device.name,
          "member": {"id": device.member?.id, "name": device.member?.name}
        }
      : {
          "id": device.id,
          "name": device.name,
        };

  print(DEVICES_URL + device.id!);
  print(body);

  http.Response response = await http.put(Uri.parse(DEVICES_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode(body));

  print('response: ' + response.body);
  print('status: ' + response.statusCode.toString());

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

Future<List<PolicyModel>> requestPolicies() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  http.Response response = await http.get(
    Uri.parse(GET_POLICY_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    },
  );

  List<PolicyListModel> polices = policyListModelFromJson(response.body);

  List<PolicyModel> oldPolicies = [];
  var i = 0;
  polices.forEach((element) {
    print('policy index: ' + i.toString());
    i++;
    List<BandwidthModel> oldBandwidth = [];
    element.bandwidths?.forEach((element) {
      oldBandwidth.add(BandwidthModel(
          bandwidth: element.getBandwidthName(),
          day: element.schedule!.getDayName(),
          date:
              'From ${element.schedule!.startTime} To ${element.schedule!.endTime}'));
    });

    List<AppModel> oldApps = [];
    element.apps?.forEach((element) {
      oldApps.add(AppModel(
          title: element,
          image: 'assets/images/chrome.png',
          isPredefined: true,
          link: ''));
    });
    element.customApps?.forEach((element) {
      oldApps.add(AppModel(
          title: element,
          image: 'assets/images/chrome.png',
          isPredefined: false,
          link: ''));
    });

    List<ConnectionTypeModel> oldConnection = [];
    element.interfaces?.forEach((element) {
      oldConnection.add(ConnectionTypeModel(
          type: element.portName.toString(),
          day: element.schedule!.getDayName(),
          date: 'From ${element.schedule!.startTime} To ${element.schedule!.endTime}'));
    });

    List<MemberModel> oldMembers = [];
    element.devices?.forEach((element) {
      bool founded = false;

      if (element.member != null) {
        oldMembers.forEach((oldMember) {
          if (oldMember.id == element.member?.id) {
            oldMember.devices?.add(DeviceModel(
                id: element.mac,
                mac: element.mac,
                isSelected: false,
                member: oldMember,
                name: element.name));
            founded = true;
          }
        });

        if (!founded) {
          oldMembers.add(MemberModel(
              id: element.member?.id.toString(),
              name: element.member?.name.toString(),
              devices: [
                DeviceModel(
                    id: element.mac,
                    mac: element.mac,
                    isSelected: false,
                    member: element.member,
                    name: element.name)
              ]));
        }
      }
    });

    oldPolicies.add(PolicyModel(
        apps: oldApps,
        bandwidths: oldBandwidth,
        name: element.title.toString(),
        connectionTypes: oldConnection,
        members: oldMembers));
  });

  print('response body${response.body}');
  print('status Code ${response.statusCode}');
  // print('policies are : $oldPolicies');
  return oldPolicies;
}

Future<MetadataModel> requestMetadata() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  http.Response response = await http.get(
    Uri.parse(GET_METADATA_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    },
  );
  var metaData = metadataModelFromJson(response.body);
  return metaData;
}

Future<List<Application>> requestApplications() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  http.Response response = await http.get(
    Uri.parse(GET_APPLICATIONS_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    },
  );

  if (response.statusCode == 200) {
    var applicationsJson = jsonDecode(response.body) as List<dynamic>;
    List<Application> applications =
        applicationsJson.map((item) => Application.fromJson(item)).toList();
    return applications;
  }

  return [];
}
Future<List<Application>> requestSearchApplications(String search) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  http.Response response = await http.get(
    Uri.parse(SEARCH_APPLICATIONS_URL + search),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    },
  );

  if (response.statusCode == 200) {
    var applicationsJson = jsonDecode(response.body) as List<dynamic>;
    List<Application> applications =
        applicationsJson.map((item) => Application.fromJson(item)).toList();
    return applications;
  }

  return [];
}