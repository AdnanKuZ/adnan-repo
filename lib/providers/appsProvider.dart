import 'package:admin/models/app.dart';
import 'package:flutter/cupertino.dart';

class AppsProvider extends ChangeNotifier {
  String policyName = '';
  String searchResult = '';
  List<AppModel> definedApps = [
    AppModel(name: 'Netflix', image: 'assets/images/netflix.png'),
    AppModel(name: 'Instagram', image: 'assets/images/instagram.png'),
    AppModel(name: 'Chrome', image: 'assets/images/chrome.png'),
  ];
  List<AppModel> customApps = [
    AppModel(
        name: 'Dropbox 1',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
    AppModel(
        name: 'Dropbox 2',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
    AppModel(
        name: 'Dropbox 3',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
  ];
  String get getSearchResult => searchResult;
  List<AppModel> get getDefinedApps => definedApps;
  List<AppModel> get getCustomApps => customApps;
  String get getPolicyName => policyName;

  void setSearchResult(String result) {
    searchResult = result;
    setDefaultApps(definedApps);
    notifyListeners();
  }

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
        .any((element) => element.name == app.name && element.isSelected);
  }

  bool isCustomAppSelected(AppModel app) {
    return customApps
        .any((element) => element.name == app.name && element.isSelected);
  }

  void setCustomAppSelected(AppModel app, bool isChecked) {
    customApps.forEach((element) {
      if (app.name == element.name) {
        element.isSelected = isChecked;
      }
    });
    notifyListeners();
  }

  void setDefinedAppSelected(AppModel app, bool isChecked) {
    definedApps.forEach((element) {
      if (app.name == element.name) {
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

  bool isNameStepValid() {
    return getPolicyName.trim().length > 0;
  }

  bool isAppsStepValid() {
    return getSelectedApps().length > 0;
  }
}
