import 'dart:convert';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/server/urls.dart';
import 'package:http/http.dart' as http;

// Getting devices
Future<List<DeviceModel>> requestDevices() async {
  http.Response response = await http.get(
    Uri.parse(DEVICES_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
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
  http.Response response = await http.post(Uri.parse(MEMBERS_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
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
  http.Response response = await http.get(
    Uri.parse(MEMBERS_URL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
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
  var body = device.member != null
      ? {
          "name": device.name,
          "member": {"id": device.member?.id}
        }
      : {"name": device.name};

  http.Response response = await http.post(Uri.parse(DEVICES_URL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
      },
      body: jsonEncode(body));

  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestExistingDevice(DeviceModel device) async {
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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
      },
      body: jsonEncode(body));

  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestDeleteDevice(DeviceModel device) async {
  http.Response response =
      await http.delete(Uri.parse(DEVICES_URL + device.id!), headers: {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
  });

  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestDeleteMember(MemberModel member) async {
  print('url: ' + MEMBERS_URL + member.id!);
  http.Response response =
      await http.delete(Uri.parse(MEMBERS_URL + member.id!), headers: {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
  });

  print('response status code: ' + response.statusCode.toString());
  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestEditMember(MemberModel member) async {
  print('url: ' + MEMBERS_URL + member.id!);
  http.Response response = await http.put(Uri.parse(MEMBERS_URL + member.id!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
      },
      body: jsonEncode({"id": member.id, "name": member.name}));

  print('response status code: ' + response.statusCode.toString());
  if (response.statusCode == 201) {
    return true;
  }

  return false;
}

Future<bool> requestEditDevice(DeviceModel device) async {
  print('url: ' + DEVICES_URL + device.id!);
  http.Response response = await http.put(Uri.parse(DEVICES_URL + device.id!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
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
  print('url: ' + DEVICES_URL + device.id!);
  http.Response response = await http.put(Uri.parse(DEVICES_URL + device.id!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwic3ViIjoiZDFmMjMxMmYtNzNjZS00MmM3LTliMGEtZDQ0NWNmNDQxYWYxIiwianRpIjoiNTI3OGRmMzMtZjJhNy00ODAxLWEzOWUtNWJlNTBlMjJmNmUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJkMWYyMzEyZi03M2NlLTQyYzctOWIwYS1kNDQ1Y2Y0NDFhZjEiLCJlbWFpbCI6ImU3N2JjZTBlMGJAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZTc3YmNlMGUwYkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoic3RyaW5nIiwiZXhwIjoxNzkxMTg3OTYxLCJpc3MiOiJodHRwczovL3NvaG9iLnRlY2giLCJhdWQiOiJodHRwczovL3NvaG9iLnRlY2gifQ.cXUAg1GHIjNT6HpVz1G_Wp1-pUTf4jmoPKLA61_2FLQ',
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
