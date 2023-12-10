import 'package:flutter/material.dart';
import 'package:kievit_flutter/shared/shared_code.dart';

class WarningDialog extends StatefulWidget {
  final String title;
  final String message;
  final String type;
  final IconData icon;
  WarningDialog(
      {Key? key,
      required this.title,
      required this.message,
      required this.type,
      required this.icon})
      : super(key: key);

  @override
  _WarningDialogState createState() => _WarningDialogState(
      title: title, message: message, type: type, icon: icon);
}

class _WarningDialogState extends State<WarningDialog> {
  _WarningDialogState(
      {required this.title,
      required this.message,
      required this.type,
      required this.icon});

  final String title;
  final String message;
  final String type;
  final IconData icon;

  //size
  double iconSize = 50;
  double iconContainerHeight = 50;
  double messageContainerHeight = 100;
  double titleSize = 20;
  double messageSize = 16;

  late Color iconColor;
  Color titleColor = blackColor;
  Color messageColor = blackColor;

  //new variable
  late IconData newIcon;
  String newTitle = "";
  String newMessage = "";

  late Widget buttonContainer;
  late Widget leftButton;
  late Widget rightButton;
  bool hasClose = true;

  void seInitialBody() {
    newIcon = icon;
    newTitle = title != null ? title : "Review";
    newMessage = message != null
        ? message
        // : "Lorem ipsum dolor sit amet, hinc verterem his eu, eos ne vero novum denique. Denique tacimates vis ex. Tacimates prodesset ut pro, et porro alterum deleniti est. Autem atqui legendos sed te. Velit feugait atomorum ei quo, elitr saperet perfecto ne eos, agam dicit numquam ut quo. In justo indoctum usu, ad atqui labores quaestio duo, ei mucius delenit percipit mei.";
        : "Message";

    //
    Widget defaultCloseButton = InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: blackColor, borderRadius: BorderRadius.circular(4)),
            child: Text("Close",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14))));
    buttonContainer = Row(
      children: [
        Expanded(
          child: defaultCloseButton,
        )
      ],
    );

    switch (type) {
      case "warning":
        newIcon = Icons.warning;
        iconColor = Colors.yellow;
        buttonContainer = buttonContainer;

        break;
      case "process":
        newIcon = Icons.hourglass_bottom;
        iconColor = Colors.blue;
        buttonContainer = SizedBox.shrink();
        hasClose = false;

        break;
      case "succeed":
        newIcon = Icons.check_circle_outline;
        iconColor = Colors.green;
        buttonContainer = SizedBox.shrink();
        hasClose = false;

        break;
      case "error":
        newIcon = Icons.error;
        iconColor = Colors.red;
        newTitle = "Error";
        break;
      default:
        newIcon = Icons.info_outline;
        newTitle = title != null ? title : "Review";
        newMessage = message != null ? message : "Message";
        leftButton = defaultCloseButton;
        buttonContainer = Row(
          children: [
            Expanded(
              child: leftButton,
            )
          ],
        );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    iconColor = Colors.red;
    seInitialBody();

    return Container(
        width: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              hasClose
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close)))
                  : SizedBox.shrink(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                    child: Icon(
                  newIcon,
                  size: iconSize,
                  color: iconColor,
                )),
              ),
              Container(
                child: Column(
                  children: [
                    Text(newTitle,
                        style: TextStyle(
                            color: titleColor,
                            fontSize: titleSize,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: messageContainerHeight,
                        child: SingleChildScrollView(
                            child: Text(newMessage,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: messageColor,
                                    fontSize: messageSize,
                                    fontWeight: FontWeight.w400))))
                  ],
                ),
              ),
              // Container(
              //   child: buttonContainer,
              // )
            ],
          ),
        ));
  }
}
