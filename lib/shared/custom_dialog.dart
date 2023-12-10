import 'package:flutter/material.dart';
import 'package:kievit_flutter/shared/color_values.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      height: 100,
      width: 10,
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            margin: EdgeInsets.only(top: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(10, 10),
                  ),
                ]),
            child: Column(
              children: <Widget>[
                Text("Info", style: TextStyle(color: Colors.black)),
                Row(children: [
                  Image.asset('assets/icons/controlable_icon.png',
                      width: 20, height: 20),
                  Text(" = Controlable", style: TextStyle(color: Colors.black)),
                ]),
                SizedBox(height: 10),
                Row(children: [
                  Image.asset('assets/icons/monitoring_icon.png',
                      width: 20, height: 20),
                  Text(" = Monitoring", style: TextStyle(color: Colors.black)),
                ]),
              ],
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: ColorValues().primaryRed,
                  child: Icon(Icons.close, color: Colors.white, size: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
