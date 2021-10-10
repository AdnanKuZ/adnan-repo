import 'package:admin/models/app.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'members.dart';

class AppsWidget extends StatefulWidget {
  final Function onClick;
  final List<AppModel> apps;
  const AppsWidget({required this.apps, required this.onClick, Key? key})
      : super(key: key);
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
            Wrap(
              children: [
                for (var app in widget.apps)
                  AppWidget(path: app.image == null ? '' : app.image!)
              ],
            )
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: widget.apps.length,
            //   itemBuilder: (context, index) {
            //     return Wrap(
            //       alignment: WrapAlignment.spaceBetween,
            //       children: [
            //         AppWidget(path: widget.apps[index].image == null ? '' : widget.apps[index].image!)
            //       ],
            //     );
            //   }),
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
  String path;
  AppWidget({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(8), child: Image.asset(path));
  }
}
