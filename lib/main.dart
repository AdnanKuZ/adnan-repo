import 'package:admin/constants.dart';
import 'package:admin/providers/MenuProvider.dart';
import 'package:admin/providers/authProviders.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/auth/sign_up_screen.dart';
import 'package:admin/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginModes(),
          ),
          ChangeNotifierProvider(
            create: (context) => SignUpModes(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Admin Panel',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: backgroundColor,
          ),
          home: LoginScreen(),
        ));
  }
}
