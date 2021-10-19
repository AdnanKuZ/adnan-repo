import 'package:admin/dialogs/auth_error_dialog.dart';
import 'package:admin/dialogs/delete_dialog.dart';
import 'package:admin/dialogs/loading_dialog.dart';
import 'package:admin/dialogs/log_out_dialog.dart';
import 'package:admin/models/policy.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/providers/policies_list_provider.dart';
import 'package:admin/server/requests.dart';
import 'package:admin/widgets/dashboard/policies/policy/seperator.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apps.dart';
import 'bandwidth.dart';
import 'connection_type.dart';
import 'members.dart';
import 'members_and_devices.dart';

typedef LoadPolicies = Function();

class PolicyWidget extends StatefulWidget {
  final PolicyModel policy;
  const PolicyWidget({required this.policy, Key? key}) : super(key: key);

  @override
  _PolicyWidgetState createState() => _PolicyWidgetState();
}

class _PolicyWidgetState extends State<PolicyWidget> {
  bool _isOpen = true;

  void expand() {
    setState(() {
      _isOpen = true;
    });
  }

  void collapse() {
    setState(() {
      _isOpen = false;
    });
  }

  void refreshPolicies(
      BuildContext context, PoliciesListProvider provider) async {
    print(3);
    var policies = await requestPolicies();
    print("policies are $policies");
    provider.setPolicies(policies);
    print(4);
  }

  @override
  Widget build(BuildContext context) {
    final policyProvider =
        Provider.of<PoliciesListProvider>(context, listen: false);
    return ExpandableNotifier(
      child: Column(
        children: [
          Expandable(
            controller: ExpandableController(initialExpanded: _isOpen),
            expanded: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Color(0xFFDCDCDC),
                  width: 1.0,
                ),
              ),
              color: Colors.white,
              shadowColor: Colors.black,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18.0, 20, 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PolicyHeader(
                          title: widget.policy.name,
                          isExpanded: _isOpen,
                          onEdit: () {},
                          onDelete: () async {
                            showDialog(
                                context: context,
                                builder: (context) => DeleteDialog(
                                      title: "Are you sure ?",
                                      onDel: () async {
                                        // loadingProvider.setLoadingState(true);
                                        await requestDeletePolicy(
                                            widget.policy.id!);
                                        // loadingProvider.setLoadingState(false);
                                        refreshPolicies(
                                            context, policyProvider);
                                      },
                                    ));
                          },
                          onLayoutChanged: () => collapse()),
                      // Seperator
                      SeperatorWidget(),
                      Text(
                        "Bandwith Limit",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.policy.bandwidths!.length,
                          itemBuilder: (context, index) {
                            return BandwidthLimitWidget(
                                days: widget.policy.bandwidths![index].day
                                    .toString(),
                                type: widget.policy.bandwidths![index].bandwidth
                                    .toString(),
                                time: widget.policy.bandwidths![index].day !=
                                        'All Days'
                                    ? widget.policy.bandwidths![index].date
                                        .toString()
                                    : '');
                          }),
                      // BandwidthLimitWidget(
                      //     days: 'Sun, Thu',
                      //     type: 'Full Bandwidth',
                      //     time: '12:00 am to 12:00 pm'),
                      // BandwidthLimitWidget(
                      //     days: 'Sun, Mon',
                      //     type: 'Full Bandwidth',
                      //     time: '12:00 am to 01:00 am'),
                      // BandwidthLimitWidget(
                      //     days: 'Sun, Mon',
                      //     type: 'Full Bandwidth',
                      //     time: '12:00 am to 01:00 am'),
                      SeperatorWidget(),
                      Text(
                        "Connection Type",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.policy.connectionTypes!.length,
                          itemBuilder: (context, index) {
                            return ConnectionTypeWidget(
                                days: widget.policy.connectionTypes![index].day
                                    .toString(),
                                type: widget.policy.connectionTypes![index]
                                            .port ==
                                        null
                                    ? widget.policy.connectionTypes![index]
                                                .type ==
                                            'vni-0/0.0'
                                        ? 'Internet'
                                        : 'LTE'
                                    : widget.policy.connectionTypes![index]
                                        .port!.title
                                        .toString(),
                                time: widget.policy.connectionTypes![index]
                                            .day !=
                                        'All Days'
                                    ? widget.policy.connectionTypes![index].date
                                        .toString()
                                    : '');
                          }),
                      // ConnectionTypeWidget(
                      //     days: 'Sun, Mon',
                      //     type: 'Cable',
                      //     time: '12:00 am to 01:00 am'),
                      // ConnectionTypeWidget(
                      //     days: 'Sun, Mon',
                      //     type: 'Full Bandwidth',
                      //     time: '12:00 am to 01:00 am'),
                      // ConnectionTypeWidget(
                      //     days: 'Sun, Mon',
                      //     type: 'Full Bandwidth',
                      //     time: '12:00 am to 01:00 am'),
                      SeperatorWidget(),
                      MembersAndDevicesWidget(
                        policy:widget.policy,
                        onClick: () {},
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.policy.members!.length,
                          itemBuilder: (context, index) {
                            return MembersWidget(
                                member: widget.policy.members![index],
                                onClick: () {});
                          }),
                      AppsWidget(
                          apps: widget.policy.apps == null
                              ? []
                              : widget.policy.apps!,
                          onClick: () {})
                    ],
                  )),
            ),
            collapsed: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Color(0xFFDCDCDC),
                  width: 1.0,
                ),
              ),
              color: Colors.white,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18.0, 20, 18.0),
                child: PolicyHeader(
                    title: widget.policy.name,
                    isExpanded: _isOpen,
                    onEdit: () {},
                    onDelete: () async {
                      showDialog(
                          context: context,
                          builder: (context) => DeleteDialog(
                                title: "Are you sure ?",
                                onDel: () async {
                                  // loadingProvider.setLoadingState(true);
                                  await requestDeletePolicy(widget.policy.id!);
                                  // loadingProvider.setLoadingState(false);
                                  refreshPolicies(context, policyProvider);
                                },
                              ));
                    },
                    onLayoutChanged: () => expand()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Policy item header
class PolicyHeader extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final Function onEdit;
  final Function onDelete;
  final Function() onLayoutChanged;

  const PolicyHeader(
      {required this.title,
      required this.isExpanded,
      required this.onEdit,
      required this.onDelete,
      required this.onLayoutChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        // IconButton(
        //     padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
        //     color: Colors.grey,
        //     icon: Icon(Icons.edit),
        //     onPressed: () {
        //       onEdit();
        //     },
        //     iconSize: 20,
        //     constraints: BoxConstraints()),
        IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            color: Colors.red,
            icon: Icon(Icons.delete),
            iconSize: 20,
            onPressed: () {
              onDelete();
            }),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: Color(0xFF95C93D),
              border: Border.all(
                color: Color(0xFF95C93D),
              ),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: IconButton(
              color: Colors.white,
              icon: Icon(isExpanded
                  ? Icons.keyboard_arrow_down_rounded
                  : Icons.keyboard_arrow_right_rounded),
              iconSize: 18,
              padding: EdgeInsets.all(0),
              onPressed: () {
                onLayoutChanged();
              }),
          constraints: BoxConstraints(),
        ),
      ],
    );
  }
}
