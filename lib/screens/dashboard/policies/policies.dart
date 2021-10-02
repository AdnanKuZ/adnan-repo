import 'package:admin/constants.dart';
import 'package:admin/widgets/Policies/policies_body.dart';
import 'package:admin/widgets/Policies/policies_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../responsive.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: PoliciesFilledScreen());
  }
}

class PoliciesEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.fromLTRB(menuPadding, defaultPadding, defaultPadding, 0),
      child: Column(
        children: [
          PoliciesHeader(false),
          Expanded(child: Container(child: PoliciesEmptyBody()))
        ],
      ),
    );
  }
}

class PoliciesFilledScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.fromLTRB(menuPadding, defaultPadding, defaultPadding, 0),
        child: Column(children: [
          PoliciesHeader(true),
      //     new StaggeredGridView.countBuilder(
      //       crossAxisCount: 4,
      //       itemCount: 8,
      //       itemBuilder: (BuildContext context, int index) => new Container(
      //           color: Colors.green,
      //           child: new Center(
      //             child: new CircleAvatar(
      //               backgroundColor: Colors.white,
      //               child: new Text('$index'),
      //             ),
      //           )),
      //       staggeredTileBuilder: (int index) =>
      //           new StaggeredTile.count(2, index.isEven ? 2 : 1),
      //       mainAxisSpacing: 4.0,
      //       crossAxisSpacing: 4.0,
      //     )
        ]),
      ),
    );
  }
}

class Cardd extends StatelessWidget {
  const Cardd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      color: Colors.white,
      shadowColor: Colors.black,
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "The Family",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      color: Colors.grey,
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                      constraints: BoxConstraints()),
                ],
              ),
              // Seperator
              Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  )),

              Text(
                "Bandwith Limit",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sun, Mon",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.black),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Small Bandwidth",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            " | ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "12:00 am to 01:00 am",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Sun, Mon",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Small Bandwidth",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "12:00 am to 01:00 am",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Sun, Mon",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Small Bandwidth",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "12:00 am to 01:00 am",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
