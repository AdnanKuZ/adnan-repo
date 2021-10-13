import 'package:admin/constants.dart';
import 'package:admin/dialogs/add_app_dialog.dart';
import 'package:admin/dialogs/auth_error_dialog.dart';
import 'package:admin/models/app.dart';
import 'package:admin/providers/add_policy_provider.dart';
import 'package:admin/providers/appsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:provider/provider.dart';
import 'package:admin/providers/stepperProviders.dart';

class AppsStepScreen extends StatefulWidget {
  AppsStepScreen({Key? key}) : super(key: key);

  @override
  State<AppsStepScreen> createState() => _AppsStepScreenState();
}

final cardSize = 0.09;
bool isCheckAll = false;

class _AppsStepScreenState extends State<AppsStepScreen> {
  String searchApp = '';
  @override
  Widget build(BuildContext context) {
    print('print');
    final screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<StageProvider>(context, listen: false);
    final appsProvider =
        Provider.of<AppsProvider>(context, listen: false);

    return Consumer<AppsProvider>(
      builder: (context, state, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Consumer<MembersAndDevicesStepProvider>(
            //   builder:(context, state, child) {
            //   return ;
            // },
            // ),
            PageHeader(
              customAppButton: () async {
                await showAddAppDialog(
                  context,
                  (name, link) {
                    appsProvider.addCustomApp(AppModel(
                      name: name,
                      image: 'assets/images/chrome.png',
                      link: link,
                    ));
                    Navigator.pop(context);
                  },
                );
              },
              selectAllButton: () {
                setState(() {
                  isCheckAll = !isCheckAll;
                });
              },
              nextButton: () {
                if (!appsProvider.isAppsStepValid()) {
                  showDialog(
                      context: context,
                      builder: (context) => AuthDialog(
                            title: "Select one app at least",
                          ));
                  return;
                }

                provider.setStageState = 3;
                provider.incrementIndex();
              },
            ),
            const SizedBox(height: 24),
            SecondHeader(),
            const SizedBox(height: 20),
            AppsGridView(screenWidth: screenWidth, list: state.definedApps),
            const SizedBox(height: 20),
            Text(
              'Custom apps',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 20),

            AppsGridView(
              screenWidth: screenWidth,
              list: state.customApps,
              isPreDifened: false,
            ),
            const SizedBox(height: 28),
            BottomInfo(),
          ],
        );
      },
    );
  }
}

class SecondHeader extends StatefulWidget {
  const SecondHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondHeader> createState() => _SecondHeaderState();
}

class _SecondHeaderState extends State<SecondHeader> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: MediaQuery.of(context).size.width > 700
          ? ResponsiveRowColumnType.ROW
          : ResponsiveRowColumnType.COLUMN,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      columnCrossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ResponsiveRowColumnItem(
          child: Text(
            'Choose from our pre-defined apps',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        ResponsiveRowColumnItem(child: SizedBox(height: 12)),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade300.withOpacity(0.1),
                hintText: 'Search Apps',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.all(4),
              ),
              onChanged: (value) {
                // setState(() {
                //   searchApp = value;
                // });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AppsGridView extends StatelessWidget {
  const AppsGridView({
    Key? key,
    required this.screenWidth,
    required this.list,
    this.isPreDifened = true,
  }) : super(key: key);

  final double screenWidth;
  final List<AppModel> list;
  final bool isPreDifened;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenWidth > 1200 ? 130 : null,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 14,
            crossAxisSpacing: 24,
            crossAxisCount: screenWidth > 1200 ? 1 : screenWidth ~/ 160),
        scrollDirection: screenWidth > 1200 ? Axis.horizontal : Axis.vertical,
        itemCount: list.length,
        itemBuilder: (_, i) => CheckBoxItem(
          list[i],
          () {},
          isCheck: isCheckAll,
          isPreDefined: isPreDifened,
        ),
      ),
    );
  }
}

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.info,
          color: primaryColor,
        ),
        SizedBox(width: 20),
        Text(
          'Setup your app restriction from our pre-defined or custom in order to control the apps working or \nblocked on the devices added under this policy',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class PageHeader extends StatelessWidget {
  final void Function() customAppButton;
  final void Function() selectAllButton;
  final void Function() nextButton;

  PageHeader(
      {required this.customAppButton,
      required this.selectAllButton,
      required this.nextButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveRowColumn(
      layout: MediaQuery.of(context).size.width > 1200
          ? ResponsiveRowColumnType.ROW
          : ResponsiveRowColumnType.COLUMN,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveRowColumnItem(
          child: Text(
            'Do you have any app restrictions for this policy?',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
          ),
        ),
        ResponsiveRowColumnItem(child: SizedBox(height: 14)),
        ResponsiveRowColumnItem(
          child: Row(
            children: [
              CustomCard(
                child: screenWidth < 700
                    ? IconButton(
                        color: Colors.black,
                        onPressed: this.customAppButton,
                        icon: Icon(Icons.add),
                      )
                    : CustomApp(customAppButton: customAppButton),
              ),
              SizedBox(width: 8),
              CustomCard(
                child: screenWidth < 550
                    ? IconButton(
                        onPressed: this.selectAllButton,
                        color: Colors.black,
                        icon: Icon(Icons.select_all))
                    : SelectApps(selectAllButton: selectAllButton),
              ),
              SizedBox(width: 8),
              screenWidth < 300
                  ? IconButton(
                      color: primaryColor,
                      onPressed: this.nextButton,
                      icon: Icon(Icons.navigate_next_rounded),
                    )
                  : NewStep(nextButton: nextButton),
            ],
          ),
        ),
      ],
    );
  }
}

class NewStep extends StatelessWidget {
  const NewStep({
    Key? key,
    required this.nextButton,
  }) : super(key: key);

  final void Function() nextButton;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: primaryColor,
      child: TextButton(
        onPressed: this.nextButton,
        child: Text(
          'Next Step',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SelectApps extends StatelessWidget {
  const SelectApps({
    Key? key,
    required this.selectAllButton,
  }) : super(key: key);

  final void Function() selectAllButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.selectAllButton,
      child: Text(
        isCheckAll ? 'Unselect All Apps' : 'Select All Apps',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class CustomApp extends StatelessWidget {
  const CustomApp({
    Key? key,
    required this.customAppButton,
  }) : super(key: key);

  final void Function() customAppButton;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: this.customAppButton,
      icon: Icon(
        Icons.add,
        color: Colors.black,
      ),
      label: Text(
        'Custom App',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class CheckBoxItem extends StatefulWidget {
  CheckBoxItem(this.app, this.onCheck,
      {required this.isCheck, required this.isPreDefined, Key? key})
      : super(key: key);

  bool isPreDefined;
  final AppModel app;
  Function onCheck;
  bool isCheck;
  @override
  _CheckBoxItemState createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  @override
  Widget build(BuildContext context) {
    final app = widget.app;
    final isPreDefined = widget.isPreDefined;
    final provider = Provider.of<AppsProvider>(context, listen: false);

    return GridTile(
      child: Container(
        width: 150,
        height: 150,
        child: Consumer<AppsProvider>(
          builder: (context, state, child) {
            return GestureDetector(
              onTap: isCheckAll
                  ? null
                  : () {
                      widget.onCheck();
                      print('1: ' + widget.isCheck.toString());
                      setState(() {
                        widget.isCheck = !widget.isCheck;
                      });
                      // if (isPreDefined) {
                      //   provider.setDefinedAppSelected(
                      //       widget.app, widget.isCheck);
                      // } else {
                      //   provider.setCustomAppSelected(
                      //       widget.app, widget.isCheck);
                      // }
                    },
              child: Opacity(
                opacity: isCheckAll ? 0.5 : 1,
                child: CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            if (!isPreDefined)
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey.shade400,
                                  size: 16,
                                ),
                              ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                color: Colors.grey.shade400.withOpacity(0.3),
                                width: 16,
                                height: 16,
                                child: Checkbox(
                                  value: isPreDefined
                                      ? state.isDefinedAppSelected(app)
                                      : state.isCustomAppSelected(app),
                                  onChanged: (_) {
                                    // print('2: ' + widget.isCheck.toString());
                                    // setState(() {
                                    //   widget.isCheck = !widget.isCheck;
                                    // });
                                    // print('2: ' + widget.isCheck.toString());
                                    print('TTTTT' + _.toString());
                                    print(state.isDefinedAppSelected(app));
                                    if (isPreDefined) {
                                      provider.setDefinedAppSelected(
                                          widget.app, _!);
                                    } else {
                                      provider.setCustomAppSelected(
                                          widget.app, _!);
                                    }
                                    print(state.isDefinedAppSelected(app));
                                  },
                                  activeColor: primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  minRadius: 24,
                                  maxRadius: 24,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    app.image!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Text(
                                      '${app.title}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    if (!isPreDefined)
                                      Text(
                                        '${app.link}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final child;
  final Color? color;
  CustomCard({this.child, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color ?? Colors.grey.shade400),
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: child,
      ),
    );
  }
}
