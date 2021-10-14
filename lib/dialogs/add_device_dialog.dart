import 'package:admin/constants.dart';
import 'package:admin/models/device.dart';
import 'package:admin/models/member.dart';
import 'package:admin/providers/add_device_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AddDeviceDialog({required BuildContext context, Color? color, MemberModel? selectedMember}) async {
  final addDeviceProvider =
      Provider.of<AddDeviceProvider>(context, listen: false);

  addDeviceProvider.setDeviceMac("");
  addDeviceProvider.setDeviceName("");
  addDeviceProvider.setSelectedDevice(null);
  addDeviceProvider.setSelectedMember(selectedMember);

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
                                : state.selectedDeviceModel!.name.toString(),
                            style: TextStyle(
                                color: state.getDeviceName.trim().length > 0
                                    ? lightGrayColor
                                    : Colors.black)
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
                      // // Device name
                      // TextFormField(
                      //   style: TextStyle(color: Colors.black),
                      //   decoration: const InputDecoration(
                      //     hintText: 'Device Name',
                      //     hintStyle: TextStyle(color: lightGrayColor),
                      //     labelStyle: TextStyle(color: lightGrayColor),
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(color: lightGrayColor),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      //   validator: (String? value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter some text';
                      //     }
                      //     return null;
                      //   },
                      //   onChanged: (value) {
                      //     addDeviceProvider.setDeviceName(value);
                      //   },
                      // ),
                      SizedBox(height: 10),
                      // TextFormField(
                      //   style: TextStyle(color: Colors.black),
                      //   decoration: const InputDecoration(
                      //     hintText: 'Mac Address',
                      //     hintStyle: TextStyle(color: lightGrayColor),
                      //     labelStyle: TextStyle(color: lightGrayColor),
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(color: lightGrayColor),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.black),
                      //     ),
                      //   ),
                      //   validator: (String? value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Mac Address';
                      //     }
                      //     return null;
                      //   },
                      //   onChanged: (value) {
                      //     addDeviceProvider.setDeviceMac(value);
                      //   },
                      // ),
                      // SizedBox(height: 10),
                      // Members
                      Consumer<AddDeviceProvider>(
                          builder: (context, state, child) {
                        return DropdownButton<MemberModel>(
                          isExpanded: true,
                          hint: Text(
                            state.selectedMemberModel == null
                                ? "Member"
                                : state.selectedMemberModel!.getName(),
                            style: TextStyle(color: Colors.black),
                          ),
                          items: <MemberModel>[...addDeviceProvider.members]
                              .map((MemberModel value) {
                            return DropdownMenuItem<MemberModel>(
                              value: value,
                              child: Text(
                                value.getName(),
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              addDeviceProvider.setSelectedMember(value);
                              print(
                                  addDeviceProvider.selectedMemberModel?.getName());
                            }
                          },
                        );
                      }),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor, // background
                          ),
                          onPressed: () {
                            if(addDeviceProvider.selectedDeviceModel == null || addDeviceProvider.selectedMemberModel == null) {
                              return;
                            }

                            var deviceName = addDeviceProvider.deviceName;
                            // var deviceMac = addDeviceProvider.deviceMac;
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
                              'Associate',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor, // background
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              'Cancel',
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
