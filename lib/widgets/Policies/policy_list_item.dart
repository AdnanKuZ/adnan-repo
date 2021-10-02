import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PolicyWidget extends StatefulWidget {
  const PolicyWidget({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      // <-- Provides ExpandableController to its children
      child: Column(
        children: [
          Expandable(
            controller: ExpandableController(
                initialExpanded:
                    _isOpen), // <-- Driven by ExpandableController from ExpandableNotifier
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
                          isExpanded: _isOpen,
                          onEdit: () {},
                          onDelete: () {},
                          onLayoutChanged: () => collapse()),
                      // Seperator
                      SeperatorWidget(),
                      Text(
                        "Bandwith Limit",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      BandwidthLimitWidget(
                          days: 'Sun, Mon',
                          type: 'Full Bandwidth',
                          time: '12:00 am to 01:00 am'),
                      BandwidthLimitWidget(
                          days: 'Sun, Mon',
                          type: 'Full Bandwidth',
                          time: '12:00 am to 01:00 am'),
                      BandwidthLimitWidget(
                          days: 'Sun, Mon',
                          type: 'Full Bandwidth',
                          time: '12:00 am to 01:00 am'),
                      SeperatorWidget(),
                      Text(
                        "Connection Type",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      ConnectionTypeWidget(
                          days: 'Sun, Mon',
                          type: 'Full Bandwidth',
                          time: '12:00 am to 01:00 am'),
                      ConnectionTypeWidget(
                          days: 'Sun, Mon',
                          type: 'Full Bandwidth',
                          time: '12:00 am to 01:00 am'),
                      ConnectionTypeWidget(
                          days: 'Sun, Mon',
                          type: 'Full Bandwidth',
                          time: '12:00 am to 01:00 am'),
                      SeperatorWidget(),
                      MembersAndDevicesWidget(
                        onClick: () {},
                      ),
                      MembersWidget(onClick: () {}),
                      AppsWidget(onClick: () {})
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
                    isExpanded: _isOpen,
                    onEdit: () {},
                    onDelete: () {},
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
  final bool isExpanded;
  final Function onEdit;
  final Function onDelete;
  final Function() onLayoutChanged;

  const PolicyHeader(
      {required this.isExpanded,
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
            "The Family",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            color: Colors.grey,
            icon: Icon(Icons.edit),
            onPressed: () {
              onEdit();
            },
            iconSize: 20,
            constraints: BoxConstraints()),
        IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            color: Colors.red,
            icon: Icon(Icons.delete),
            iconSize: 20,
            onPressed: () {
              onDelete();
            },
            constraints: BoxConstraints()),
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

class SeperatorWidget extends StatelessWidget {
  const SeperatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Divider(
          height: 1,
          color: Color(0xFFF3F3F3),
        ));
  }
}

// Bandwidth limitations
class BandwidthLimitWidget extends StatelessWidget {
  final String days;
  final String type;
  final String time;

  const BandwidthLimitWidget(
      {required this.days, required this.type, required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(
            days,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Wrap(
            children: [
              Text(
                type,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.black),
              ),
              Text(
                " | ",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Color(0xFFD6D6D6)),
              ),
              Text(
                time,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Color(0xFFA5A5A5)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Connection Types
class ConnectionTypeWidget extends StatelessWidget {
  final String days;
  final String type;
  final String time;

  const ConnectionTypeWidget(
      {required this.days, required this.type, required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BandwidthLimitWidget(days: days, type: type, time: time);
  }
}

// Members And Devices
class MembersAndDevicesWidget extends StatelessWidget {
  final Function onClick;

  const MembersAndDevicesWidget({required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFA5A5A5),
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0, 10.0, 0),
                      child: Icon(
                        Icons.devices_rounded,
                        size: 20,
                      ),
                    ),
                    Text(
                      "Members And Devices",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "Show All",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Members
class MembersWidget extends StatefulWidget {
  final Function onClick;
  const MembersWidget({required this.onClick, Key? key}) : super(key: key);
  @override
  State<MembersWidget> createState() => _MembersWidgetState();
}

class _MembersWidgetState extends State<MembersWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Expandable(
        controller: ExpandableController(
            initialExpanded:
                _isOpen), // <-- Driven by ExpandableController from ExpandableNotifier
        expanded: Card(
          margin: EdgeInsets.all(0),
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
              padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MembersHeaderWidget(
                    title: "Khalid Saied",
                      isExpanded: _isOpen, onLayoutChanged: () => collapse()),
                  MemberDeviceWidget()
                ],
              )),
        ),
        collapsed: Card(
          margin: EdgeInsets.all(0),
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
              padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MembersHeaderWidget(
                    title: "Khalid Saied",
                      isExpanded: _isOpen, onLayoutChanged: () => expand())
                ],
              )),
        ),
      ),
    );
  }
}

class MembersHeaderWidget extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final Function() onLayoutChanged;

  const MembersHeaderWidget(
      {
        required this.title, 
        required this.isExpanded, 
        required this.onLayoutChanged
        , Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
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

class MemberDeviceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    color: Color(0xFF95C93D), shape: BoxShape.circle),
              ),
              Text(
                "iPhone 12",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.black),
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "IP: ",
                style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "192.168.0.0",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AppsWidget extends StatefulWidget {
  final Function onClick;
  const AppsWidget({required this.onClick, Key? key}) : super(key: key);
  @override
  State<AppsWidget> createState() => _AppsWidgetState();
}

class _AppsWidgetState extends State<AppsWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Expandable(
        controller: ExpandableController(
            initialExpanded:
                _isOpen), // <-- Driven by ExpandableController from ExpandableNotifier
        expanded: Card(
          margin: EdgeInsets.all(0),
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
              padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppsHeaderWidget(
                      isExpanded: _isOpen, onLayoutChanged: () => collapse()),
                  //MemberDeviceWidget()
                ],
              )),
        ),
        collapsed: Card(
          margin: EdgeInsets.all(0),
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
              padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppsHeaderWidget(
                      isExpanded: _isOpen, onLayoutChanged: () => expand())
                ],
              )),
        ),
      ),
    );
  }
}

class AppsHeaderWidget extends StatelessWidget {
  final bool isExpanded;
  final Function() onLayoutChanged;

  const AppsHeaderWidget(
      {required this.isExpanded, required this.onLayoutChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MembersHeaderWidget(
      title: "Apps",
        isExpanded: isExpanded, onLayoutChanged: onLayoutChanged);
  }
}
