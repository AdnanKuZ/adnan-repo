import 'package:admin/models/metadata.dart';
import 'package:flutter/cupertino.dart';

class MetadataProvider extends ChangeNotifier {
  Map<String, dynamic> _metaData = {
    "ports": [],
    "maxBandwidth": 0,
    "cpeIdentifier": "JAB21020289"
  };
  get getmetadata => _metaData;
  void setMetaData(MetadataModel meta) {
    _metaData["ports"] = meta.ports;
    _metaData["maxBandwidth"] = meta.maxBandwidth;
    _metaData["cpeIdentifier"] = meta.cpeIdentifier;
    notifyListeners();
  }
}
