import 'package:admin/constants.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/providers/policies_list_provider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/widgets/dashboard/policies/policies_body.dart';
import 'package:admin/widgets/dashboard/policies/policies_header.dart';
import 'package:admin/widgets/dashboard/policies/policy/policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:admin/server/requests.dart';
import 'package:provider/provider.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  bool isFilled = false;
  var requestPolicy;
  bool isInitiated = false;
  bool isLoading = false;
  @override
  void initState() {
    requestPolicy = requestPolicies();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    loadPolicies();
    super.didChangeDependencies();
  }

  Future<void> loadPolicies() async {
    if (isInitiated) return;
    isLoading = true;
    final provider = Provider.of<PoliciesListProvider>(context, listen: false);
    var policies = await requestPolicies();
    print('policyId ${policies[0].id}');
    provider.setPolicies(policies);
    isInitiated = true;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PoliciesListProvider>(builder: (context, state, child) {
      if (!isLoading) {
        if (state.policies.isEmpty) {
          return SafeArea(child: PoliciesEmptyScreen());
        } else {
          return PoliciesFilledScreen(policies: state.policies);
        }
      } else {
        return Center(
            child: Container(
                width: 50, height: 50, child: CircularProgressIndicator()));
      }
    });
  }
}

class PoliciesEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 48),
      // padding: EdgeInsets.fromLTRB(
      //     Responsive.isMobile(context) ? defaultPadding : menuPadding,
      //     defaultPadding,
      //     defaultPadding,
      //     0),
      child: Column(
        children: [
          PoliciesHeader(showAddButton: false),
          Expanded(child: Container(child: PoliciesEmptyBody()))
        ],
      ),
    );
  }
}

class PoliciesFilledScreen extends StatelessWidget {
  final List<PolicyModel> policies;

  const PoliciesFilledScreen({required this.policies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
            Responsive.isMobile(context) ? 0 : menuPadding,
            defaultPadding,
            Responsive.isMobile(context) ? 0 : defaultPadding,
            0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: Responsive.isMobile(context)
                ? EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0)
                : EdgeInsets.all(0),
            child: PoliciesHeader(showAddButton: true),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  border: Border.all(
                    color: Color(0xFFFAFAFA),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: new StaggeredGridView.countBuilder(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding,
                    defaultPadding, defaultPadding),
                crossAxisCount: Responsive.is425to850(context)
                    ? 3
                    : Responsive.is425(context)
                        ? 1
                        : 3,
                itemCount: policies.length,
                itemBuilder: (BuildContext context, int index) => new Container(
                    child: PolicyWidget(
                  policy: policies[index],
                )),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
