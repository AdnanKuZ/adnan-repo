import 'package:admin/constants.dart';
import 'package:admin/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import '../../../responsive.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
// SafeArea(
//       child: SingleChildScrollView(
//         padding: EdgeInsets.all(defaultPadding),
//         child: Column(
//           children: [
//             Header(),
//             SizedBox(height: defaultPadding),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: Column(
//                     children: [
//                       MyFiles(),
//                       SizedBox(height: defaultPadding),
//                       RecentFiles(),
//                       if (Responsive.isMobile(context))
//                         SizedBox(height: defaultPadding),
//                       if (Responsive.isMobile(context)) StarageDetails(),
//                     ],
//                   ),
//                 ),
//                 if (!Responsive.isMobile(context))
//                   SizedBox(width: defaultPadding),
//                 // On Mobile means if the screen is less than 850 we dont want to show it
//                 if (!Responsive.isMobile(context))
//                   Expanded(
//                     flex: 2,
//                     child: StarageDetails(),
//                   ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );