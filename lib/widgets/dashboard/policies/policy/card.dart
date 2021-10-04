import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NestedCardHeader extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final Function() onLayoutChanged;

  const NestedCardHeader(
      {required this.title,
      required this.isExpanded,
      required this.onLayoutChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700),
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
              )
            ],
          )),
    );
  }
}

class NestedCardBody extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final Function() onLayoutChanged;
  final List<Widget> widgets;

  const NestedCardBody(
      {required this.title,
      required this.isExpanded,
      required this.onLayoutChanged,
      required this.widgets,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700),
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
              ),
              // Body
              ...widgets
            ],
          )),
    );
  }
}