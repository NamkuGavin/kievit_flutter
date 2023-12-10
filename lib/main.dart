import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kievit_flutter/themes/app_theme_data.dart';
import 'package:kievit_flutter/views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Kievit',
      theme: AppThemeData().getTheme(),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
