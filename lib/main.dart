import 'package:admin/constants.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/add_device_provider.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/providers/bandwidthProvider.dart';
import 'package:admin/providers/conncetionProvider.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/providers/stepperProviders.dart';
import 'package:admin/providers/MembersAndDevicesStepProvider.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/stepper/stepper_screen.dart';
import 'package:admin/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:admin/test.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
            create: (context) => MembersAndDevicesStepProvider()
          ),
          ChangeNotifierProvider(
            create: (context) => PassValidProvider()
          ),
          ChangeNotifierProvider(
            create: (context) => BandwidthProvider()
          ),
          ChangeNotifierProvider(
            create: (context) => ConnectionProvider()
          ),
          ChangeNotifierProvider(
            create: (context) => AddDeviceProvider()
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OneFi',
          theme: ThemeData.dark().copyWith(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: backgroundColor,
          ),
          home: LoginScreen(),
        ));
  }
}
