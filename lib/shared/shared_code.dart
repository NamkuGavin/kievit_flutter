import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kievit_flutter/shared/custom_alert_dialog.dart';

final Color blackColor = HexColor("#3d3d3d");
final Color greyColor = HexColor("#f2f2f2");

class SharedCode {
  static showAlertDialog(
      BuildContext context, String title, String content, String status,
      {dynamic onButtonPressed = 0}) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
              title: title,
              content: content,
              status: status,
              onButtonPressed: onButtonPressed);
        });
  }

  static String? emptyValidator(value) {
    return value.toString().trim().isEmpty ? 'Field can\'t be blank' : null;
  }

  static showSnackBar(BuildContext context, String status, String content) {
    Color color = Colors.white;
    switch (status) {
      case 'success':
        color = Colors.green.shade300;
        break;
      case 'warning':
        color = Colors.yellow.shade800;
        break;
    }
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(content,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      action: SnackBarAction(
        label: "Dismiss",
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      backgroundColor: color,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
