import 'package:admin/constants.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/add_device_provider.dart';
import 'package:admin/providers/appsProvider.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/providers/bandwidthProvider.dart';
import 'package:admin/providers/conncetionProvider.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/providers/metaDataProvider.dart';
import 'package:admin/providers/policies_list_provider.dart';
import 'package:admin/providers/stepperProviders.dart';
import 'package:admin/providers/add_policy_provider.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/auth/sign_up_screen.dart';
import 'package:admin/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;
Future<void> main() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  // token = _prefs.getString('token');
  _prefs.setString(
    'token',
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOWViMDYyZjEtOGYxNy00MmZlLTg4OGEtYTg4YTY5OWZmZjE3Iiwic3ViIjoiOWViMDYyZjEtOGYxNy00MmZlLTg4OGEtYTg4YTY5OWZmZjE3IiwianRpIjoiYWM4ZmY2YTEtNmJlYy00NjBlLWE3ZGEtYTdhZDdkYzEzNzg1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI5ZWIwNjJmMS04ZjE3LTQyZmUtODg4YS1hODhhNjk5ZmZmMTciLCJlbWFpbCI6ImQzNGM2YmE4MTZAZW1haWxuYXguY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiZDM0YzZiYTgxNkBlbWFpbG5heC5jb20iLCJodHRwOi8vc29ib2IudGVjaC9jbGFpbXMvY3BlIjoiSkFCMjEwMjAyODkiLCJleHAiOjE3OTE2MzA5NzQsImlzcyI6Imh0dHBzOi8vc29ob2IudGVjaCIsImF1ZCI6Imh0dHBzOi8vc29ob2IudGVjaCJ9.eEaoOC-7Rze06wkVNWmkdqVO30A8-T6-RcPWixToGQI"
  );
  token = _prefs.getString('token');
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
          ChangeNotifierProvider(create: (context) => IsLoading()),
          ChangeNotifierProvider(
            create: (context) => ContactUsProvider(null),
          ),
          ChangeNotifierProvider(
            create: (context) => StageProvider(),
          ),
          ChangeNotifierProvider(create: (context) => AddPolicyProvider()),
          ChangeNotifierProvider(create: (context) => PassValidProvider()),
          ChangeNotifierProvider(create: (context) => BandwidthProvider()),
          ChangeNotifierProvider(create: (context) => ConnectionProvider()),
          ChangeNotifierProvider(create: (context) => AddDeviceProvider()),
          ChangeNotifierProvider(create: (context) => PoliciesListProvider()),
          ChangeNotifierProvider(create: (context) => MetadataProvider()),
          ChangeNotifierProvider(create: (context) => AppsProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OneFi',
          theme: ThemeData(fontFamily: fontFamily),
          // ThemeData.dark().copyWith(
          //   primaryColor: primaryColor,
          //   scaffoldBackgroundColor: backgroundColor,
          //   textTheme: TextTheme(
          //     bodyText1: TextStyle(
          //       fontFamily: "Poppins"
          //     ),
          //     overline:  TextStyle(
          //       fontFamily: "Poppins"
          //     ),
          //     caption: TextStyle(
          //       fontFamily: "Poppins"
          //     ),
          //   ),
          //   // textTheme: TextTheme(),
          //   // GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          //   //     .apply(bodyColor: Colors.white),
          //   canvasColor: backgroundColor,
          // ),
          home:
          // LoginScreen()
              token == null || token == '' ? LoginScreen() : DashboardScreen(),
        ));
  }
}
