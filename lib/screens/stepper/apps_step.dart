import 'package:admin/constants.dart';
import 'package:admin/models/app.dart';
import 'package:flutter/material.dart';
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
  final List<AppModel> list = [
    AppModel(name: 'Netflix', image: 'assets/images/netflix.png'),
    AppModel(name: 'Instagram', image: 'assets/images/instagram.png'),
    AppModel(name: 'Chrome', image: 'assets/images/chrome.png'),
    AppModel(name: 'Instagram', image: 'assets/images/instagram.png'),
    AppModel(name: 'Chrome', image: 'assets/images/chrome.png'),
    AppModel(name: 'Instagram', image: 'assets/images/instagram.png'),
  ];
  final List<AppModel> list2 = [
    AppModel(
        name: 'Dropbox',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
    AppModel(
        name: 'Dropbox',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
    AppModel(
        name: 'Dropbox',
        image: 'assets/images/chrome.png',
        link: 'http//fjdfk.com'),
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StageProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PageHeader(
          customAppButton: () {},
          selectAllButton: () {
            setState(() {
              isCheckAll = !isCheckAll;
            });
          },
          nextButton: () {
            provider.setStageState = 3;
            provider.setStageIndex = provider.stageIndex + 1;
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose from our pre-defined apps',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
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
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.width * cardSize,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (_, i) => CheckBoxItem(list[i], () {},isCheck: isCheckAll),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Custom apps',
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.width * cardSize,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list2.length,
            itemBuilder: (_, i) => CheckBoxItem(
              list2[i],
              () {},
              isPreDefined: true,isCheck: isCheckAll,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Row(
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
    return Row(
      children: [
        Expanded(
          child: Text(
            'Do you have any app restrictions for this policy?',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
          ),
        ),
        CustomCard(
          child: TextButton.icon(
            onPressed: this.customAppButton,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: Text(
              'Custom App',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(width: 8),
        CustomCard(
          child: TextButton(
            onPressed: this.selectAllButton,
            child: Text(isCheckAll?
              'Unselect All Apps'
            :  'Select All Apps',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(width: 8),
        CustomCard(
          color: primaryColor,
          child: TextButton(
            onPressed: this.nextButton,
            child: Text(
              'Next Step',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckBoxItem extends StatefulWidget {
  CheckBoxItem(this.app, this.onCheck,
      {required this.isCheck, this.isPreDefined, Key? key})
      : super(key: key);

  bool? isPreDefined = false;
  final AppModel app;
  Function onCheck;
  bool isCheck;
  @override
  _CheckBoxItemState createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  @override
  Widget build(BuildContext context) {
   widget.isCheck;
    final app = widget.app;
    final isPreDefined = widget.isPreDefined;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          widget.onCheck();
          setState(() {
            widget.isCheck = !widget.isCheck;
          });
        },
        child: CustomCard(
          child: Container(
            width: MediaQuery.of(context).size.width * cardSize,
            height: MediaQuery.of(context).size.width * cardSize,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    if (isPreDefined ?? false)
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
                          value: widget.isCheck,
                          onChanged: (_) {
                            setState(() {
                              widget.isCheck = !widget.isCheck;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        minRadius: 20,
                        maxRadius: 20,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          app.image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        '${app.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      if (isPreDefined ?? false)
                        Text(
                          '${app.link}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
    return Card(
      //margin: EdgeInsets.all(8.0),
      color: color ?? Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(color: color ?? Colors.grey.shade400),
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: child,
      ),
    );
  }
}
