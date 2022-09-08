import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rps_ui_copy/login/login_screen.dart';
import 'package:rps_ui_copy/login/registration_screen.dart';
import 'package:rps_ui_copy/screens/home_screen.dart';
import 'package:rps_ui_copy/screens/intro_screen.dart';
import 'package:rps_ui_copy/utils/constants.dart';
import 'package:splashscreen/splashscreen.dart';
import './screens/intro_screen.dart';
import './login/login_screen.dart';
import './login/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1',
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        accentColor: COLOR_DARK_BLUE,
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
        fontFamily: "Montserrat"
      ),
      // home: HomeScreen(),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds:LoginScreen(),
        title: new Text(
          'Welcome to \n House Construction App',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          loaderColor: Colors.blue
      ),
    );
  }
}

