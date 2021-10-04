import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return SingleChildScrollView(
      child: Container(
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
                  Image.asset("assets/images/empty_policies.png", width: 300,),
                  Text(
                    "No Policies Yet",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "Start adding some policies to see displayed here and manager through them",
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
          child: new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) => new Container(
                color: Colors.green,
                child: new Center(
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text('$index'),
                  ),
                )),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ));
  }
}
