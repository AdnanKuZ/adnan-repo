import 'package:flutter/cupertino.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16,horizontal: 48),
            child: Column(
      children: [
        DashboardHeader(),
      ],
    )));
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