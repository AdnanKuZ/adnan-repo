import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

class PoliciesBody extends StatelessWidget {
  const PoliciesBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PoliciesFilledBody();
  }
}

class PoliciesEmptyBody extends StatelessWidget {
  const PoliciesEmptyBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No Policies Yet",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                    "Start adding some policies to see  and manager thtough them",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: textGray,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 1 : 1),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Add New"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PoliciesFilledBody extends StatefulWidget {
  const PoliciesFilledBody({
    Key? key,
  }) : super(key: key);

  @override
  State<PoliciesFilledBody> createState() => _PoliciesFilledBodyState();
}

class _PoliciesFilledBodyState extends State<PoliciesFilledBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFFFAFAFA)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
              Text('test'),
            ],
          ),
        ));
  }
}
