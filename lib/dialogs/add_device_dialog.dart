import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/add_device_provider.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/server/requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AddDeviceDialog({required BuildContext context,Color? color}) async {
  final addDeviceProvider =
      Provider.of<AddDeviceProvider>(context, listen: false);

  addDeviceProvider.setDeviceMac("");
  addDeviceProvider.setDeviceName("");
  addDeviceProvider.setSelectedDevice(null);
  addDeviceProvider.setSelectedMember(null);

  return showDialog<DeviceModel>(
      context: context,
      builder: (context) {
        var primaryColor = color;
        return new AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          content: StatefulBuilder(
            builder: (context, state) {
              return Container(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Consumer<AddDeviceProvider>(
                          builder: (context, state, child) {
                        print(state.getDeviceName.trim().length > 0);
                        return DropdownButton<DeviceModel>(
                          isExpanded: true,
                          hint: Text(
                            state.selectedDeviceModel == null
                                ? "Select Device Name"
                                : state.selectedDeviceModel!.name!,
                            style: TextStyle(
                                color: state.getDeviceName.trim().length > 0
                                    ? lightGrayColor
                                    : Colors.black),
                          ),
                          items: <DeviceModel>[...addDeviceProvider.devices]
                              .map((DeviceModel value) {
                            return DropdownMenuItem<DeviceModel>(
                              value: value,
                              child: Text(
                                value.name == null ? 'undefined' : value.name!,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: state.getDeviceName.trim().length > 0
                              ? null
                              : (value) {
                                  if (value != null) {
                                    addDeviceProvider.setSelectedDevice(value);
                                  }
                                },
                        );
                      }),
                      SizedBox(height: 10),
                      // Device name
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: 'Device Name',
                          hintStyle: TextStyle(color: lightGrayColor),
                          labelStyle: TextStyle(color: lightGrayColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: lightGrayColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          addDeviceProvider.setDeviceName(value);
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: 'Mac Address',
                          hintStyle: TextStyle(color: lightGrayColor),
                          labelStyle: TextStyle(color: lightGrayColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: lightGrayColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Mac Address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          addDeviceProvider.setDeviceMac(value);
                        },
                      ),
                      SizedBox(height: 10),
                      // Members
                      DropdownButton<MemberModel>(
                        isExpanded: true,
                        hint: Text(
                          addDeviceProvider.selectedMemberModel == null
                              ? "Member"
                              : addDeviceProvider.selectedMemberModel!.name!,
                          style: TextStyle(color: Colors.black),
                        ),
                        items: <MemberModel>[...addDeviceProvider.members]
                            .map((MemberModel value) {
                          return DropdownMenuItem<MemberModel>(
                            value: value,
                            child: Text(
                              value.name != null ? value.name! : "undefuned",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            addDeviceProvider.setSelectedMember(value);
                          }
                        },
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor, // background
                          ),
                          onPressed: () {
                            var deviceName = addDeviceProvider.deviceName;
                            var deviceMac = addDeviceProvider.deviceMac;
                            var selectedDevice =
                                addDeviceProvider.selectedDeviceModel;
                            var selectedMember =
                                addDeviceProvider.selectedMemberModel;
                            DeviceModel device = deviceName.length == 0
                                ? selectedDevice!
                                : DeviceModel(name: deviceName);
                            if (selectedMember != null) {
                              device.setMember(selectedMember);
                            }
                            Navigator.pop(context, device);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              'Add Device',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}
