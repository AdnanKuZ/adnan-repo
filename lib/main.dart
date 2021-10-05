import 'package:admin/constants.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/providers/dropDownProvider.dart';
import 'package:admin/providers/stepperProviders.dart';
// import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/stepper/stepper_screen.dart';
import 'package:admin/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:admin/test.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PassHiddenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => EmailValidProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginModes(),
          ),
          ChangeNotifierProvider(
            create: (context) => SignUpModes(),
          ),
          ChangeNotifierProvider(
            create: (context) => IsLoading()
          ),
          ChangeNotifierProvider(
            create: (_) => ContactUsProvider(null),
          ),
          ChangeNotifierProvider(
            create: (context) => StageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => DropDownProvider(),
          ),
        ],
        child: MaterialApp(
          // builder: (context, widget) => ResponsiveWrapper.builder(
          //   ClampingScrollWrapper.builder(context, widget!),
          //   breakpoints: const [
          //     ResponsiveBreakpoint.resize(850, name: MOBILE),
          //     ResponsiveBreakpoint.autoScale(850, name: TABLET),
          //     ResponsiveBreakpoint.resize(1100, name: DESKTOP),
          //   ],
          // ),
          debugShowCheckedModeBanner: false,
          title: 'OneFi',
          theme: ThemeData.dark().copyWith(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: backgroundColor,
          ),
          home: StepperScreen(),
        ));
  }
}
