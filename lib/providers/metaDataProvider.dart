import 'package:admin/models/metadata.dart';
import 'package:flutter/cupertino.dart';

class MetadataProvider extends ChangeNotifier {
  Map<String, dynamic> _metaData = {
    "ports": [Port(title: "Internet",name: "vni-0/0.0",isLte: false)],
    "bandwidthSpeeds": [BandwidthSpeed(name: "HIGH_BANDWIDTH_SPEED",value: 20000)],
    "cpeIdentifier": "JAB21020289"
  };
  Map<String, dynamic> get getmetadata => _metaData;
  void setMetaData(MetadataModel meta) {
    _metaData["ports"] = meta.ports;
    _metaData["bandwidthSpeeds"] = meta.bandwidthSpeeds;
    _metaData["cpeIdentifier"] = meta.cpeIdentifier;
    notifyListeners();
  }
}
