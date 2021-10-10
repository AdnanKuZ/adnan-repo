import 'dart:convert';
import 'package:admin/models/app.dart';
import 'package:admin/models/bandwidth.dart';
import 'package:admin/models/connection_type.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
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

  http.Response response = await http.get(
    Uri.parse(DEVICES_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    },
  );

  if (response.statusCode == 200) {
    var devicesJson = jsonDecode(response.body) as List<dynamic>;
    List<DeviceModel> devices =
        devicesJson.map((item) => DeviceModel.fromJson(item)).toList();
    return devices;
  }

  return [];
}

Future<bool> requestAddMember(String name) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

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

Future<bool> requestAddPolicy(PolicyModel policy) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString('token').toString();

  List<String?> devicesIds = [];
  for (MemberModel member in policy.members!) {
    var ids = member.devices?.map((value) => value.id).toList();
    devicesIds.addAll(ids!);
  }

  http.Response response = await http.post(Uri.parse(ADD_POLICY_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: jsonEncode({
        "userIds": [],
        "deviceIds": [...devicesIds],
        "lteBandwidth": "50",
        "cableBandwidth": "50",
        // "bandwidths": [
        //   {
        //     "value": "<double>",
        //     "schedule": {
        //       "day": "<integer>",
        //       "allDays": "<boolean>",
        //       "startTime": {},
        //       "endTime": {}
        //     }
        //   },
        //   {
        //     "value": "<double>",
        //     "schedule": {
        //       "day": "<integer>",
        //       "allDays": "<boolean>",
        //       "startTime": {},
        //       "endTime": {}
        //     }
        //   }
        // ],
        // "interfaces": [
        //   {
        //     "portName": "<string>",
        //     "schedule": {
        //       "day": "<integer>",
        //       "allDays": "<boolean>",
        //       "startTime": {},
        //       "endTime": {}
        //     }
        //   },
        //   {
        //     "portName": "<string>",
        //     "schedule": {
        //       "day": "<integer>",
        //       "allDays": "<boolean>",
        //       "startTime": {},
        //       "endTime": {}
        //     }
        //   }
        // ],
        // "apps": ["<string>", "<string>"],
        // "customApps": ["<string>", "<string>"]
      }));

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

// Future<List<PolicyListModel>>
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
  polices.forEach((element) {
    List<BandwidthModel> oldBandwidth = [];
    element.bandwidths!.forEach((element) {
      oldBandwidth.add(BandwidthModel(
          bandwidth: element.value.toString(),
          day: element.schedule!.day.toString(),
          date:
              'From ${element.schedule!.startTime} To ${element.schedule!.endTime}'));
    });

    List<AppModel> oldApps = [];
    element.apps!.forEach((element) {
      oldApps.add(
          AppModel(name: element, image: '', isPredefined: true, link: ''));
    });

    List<ConnectionTypeModel> oldConnection = [];
    element.interfaces!.forEach((element) {
      oldConnection.add(ConnectionTypeModel(
          type: element.portName.toString(),
          day: element.schedule!.day.toString(),
          date:
              'From ${element.schedule!.startTime} To ${element.schedule!.endTime}'));
    });

    List<MemberModel> oldMembers = [];
    element.devices!.forEach((element) {
      bool founded = false;

      oldMembers.forEach((oldMember) {
        if (oldMember.id == element.member!.id) {
          oldMember.devices!.add(DeviceModel(
              id: element.macAddress,
              mac: element.macAddress,
              isSelected: false,
              member: oldMember,
              name: element.name));
          founded = true;
        }
      });

      if (!founded) {
        oldMembers.add(MemberModel(
            id: element.member!.id,
            name: element.member!.name,
            devices: [
              DeviceModel(
                  id: element.macAddress,
                  mac: element.macAddress,
                  isSelected: false,
                  member: null,
                  name: element.name)
            ]));
      }

      // MemberModel(
      //   name: element.member!.name,
      //   id: element.member!.id,
      //   devices:
      // );
    });
    oldPolicies.add(PolicyModel(
        apps: oldApps,
        bandwidths: oldBandwidth,
        name: element.userIds.toString(),
        connectionTypes: oldConnection,
        members: oldMembers));
  });
  // print(response.body);
  print(response.statusCode);
  return oldPolicies;
}
