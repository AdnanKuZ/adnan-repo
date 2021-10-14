import 'package:admin/models/app.dart';
import 'package:flutter/cupertino.dart';

class AppsProvider extends ChangeNotifier {
  String policyName = '';
  List<AppModel> definedApps = [
    AppModel(title: 'Netflix', image: 'assets/images/netflix.png'),
    AppModel(title: 'Instagram', image: 'assets/images/instagram.png'),
    AppModel(title: 'Chrome', image: 'assets/images/chrome.png'),
  ];
  List<AppModel> customApps = [
    AppModel(
        title: 'Dropbox 1',
        image: 'assets/images/chrome.png',
        link: 'http//test.com'),
    AppModel(
        title: 'Dropbox 2',
        image: 'assets/images/chrome.png',
        link: 'http//google.com'),
    AppModel(
        title: 'Dropbox 3',
        image: 'assets/images/chrome.png',
        link: 'http//dropBox.com'),
  ];
  List<AppModel> get getDefinedApps => definedApps;
  List<AppModel> get getCustomApps => customApps;

  void setDefaultApps(List<AppModel> apps) {
    this.definedApps = apps;
    notifyListeners();
  }

  void addDefaultApp(AppModel app) {
    this.definedApps.add(app);
    notifyListeners();
  }

  void addCustomApp(AppModel app) {
    this.customApps.add(app);
    notifyListeners();
  }

  void setCustomDevices(List<AppModel> apps) {
    this.customApps = apps;
    notifyListeners();
  }

  bool isDefinedAppSelected(AppModel app) {
    return definedApps
        .any((element) => element.title == app.title && element.isSelected);
  }

  bool isCustomAppSelected(AppModel app) {
    return customApps
        .any((element) => element.title == app.title && element.isSelected);
  }

  void setCustomAppSelected(AppModel app, bool isChecked) {
    customApps.forEach((element) {
      if (app.title == element.title) {
        element.isSelected = isChecked;
      }
    });
    notifyListeners();
  }

  void setDefinedAppSelected(AppModel app, bool isChecked) {
    definedApps.forEach((element) {
      if (app.title == element.title) {
        element.isSelected = isChecked;
      }
    });
    notifyListeners();
  }

  List<AppModel> getSelectedApps() {
    List<AppModel> selectedApps = [];
    selectedApps.addAll(definedApps.where((element) => element.isSelected));
    selectedApps.forEach((element) {
      element.isPredefined = true;
    });
    selectedApps.addAll(customApps.where((element) => element.isSelected));
    return selectedApps;
  }

  List<AppModel> getSelectedDefinedApps() {
    List<AppModel> selectedApps = [];
    selectedApps.addAll(definedApps.where((element) => element.isSelected));
    return selectedApps;
  }

  bool isAppsStepValid() {
    return getSelectedApps().length > 0;
  }
}
