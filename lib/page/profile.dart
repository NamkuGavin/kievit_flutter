import 'package:flutter/material.dart';
import 'package:kievit_flutter/shared/shared_code.dart';
import 'package:kievit_flutter/views/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, size: 70.0, color: Colors.grey),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  SharedCode.showAlertDialog(
                      context, 'Confirmation', 'Do you want logout?', 'warning',
                      onButtonPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
                  });
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(primary: Colors.red)),
          ],
        ),
      )),
    );
  }
}
