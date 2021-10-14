import 'package:admin/models/policy.dart';
import 'package:flutter/cupertino.dart';

class PoliciesListProvider extends ChangeNotifier {
  List<PolicyModel> policies = [];
  List<PolicyModel> get getPolicies => policies;

  void setPolicies(List<PolicyModel> policies) {
    this.policies = policies;
    notifyListeners();
  }
}
