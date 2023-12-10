import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/user_model.dart';
import 'package:kievit_flutter/network/login_api.dart';
import 'package:kievit_flutter/page/home.dart';
import 'package:kievit_flutter/views/landing/landing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();

      if (prefs.getString('user')==null &&
          prefs.getString('password')==null) {
        print("masuk");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Landing()));
      }else{
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Home()));
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Image.asset('assets/friesland_logo.png',
            width: MediaQuery.of(context).size.width * 0.5),
      ),
    );
  }
}
