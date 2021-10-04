import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'members.dart';

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
        expanded: NestedCardBody(
          isExpanded: _isOpen,
          onLayoutChanged: () => collapse(),
          title: 'Apps',
          widgets: [
            Wrap(children: [
              AppWidget(),
              AppWidget(),
              AppWidget(),
              AppWidget(),
              AppWidget(),
              AppWidget(),
              AppWidget(),
              AppWidget(),
            ],)
          ],
        ),
        collapsed: NestedCardHeader(
            title: 'Apps',
            isExpanded: _isOpen,
            onLayoutChanged: () => expand()),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Icon(Icons.apps, color: Colors.red), color: Colors.transparent,);
  }
}
