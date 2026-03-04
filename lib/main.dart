import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_application/Screens/Splashscreen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
