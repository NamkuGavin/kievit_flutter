import 'package:flutter/material.dart';
import 'package:kievit_flutter/views/login/login_page.dart';

class Slide extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool hasButton;

  Slide(
      {Key? key,
      required this.title,
      required this.description,
      required this.image,
      required this.hasButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            flex: 1,
            child: Image.asset('assets/$image',
                width: MediaQuery.of(context).size.width * 0.3)),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500)),
                    SizedBox(height: 25.0),
                    Text(description, style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              ),
              Flexible(
                  flex: 1,
                  child: hasButton
                      ? SizedBox(
                          width: MediaQuery.of(context).size.height * 0.5,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          LoginPage(),
                                      transitionsBuilder:
                                          (c, anim, a2, child) =>
                                              FadeTransition(
                                               opacity: anim,
                                                child: child,),
                                      transitionDuration:
                                      Duration(milliseconds: 2500)),
                                );
                              },
                              child: Text('Get Started')))
                      : SizedBox.shrink())
            ],
          ),
        )
      ],
    );
  }
}
