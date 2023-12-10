import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:kievit_flutter/shared/shared_code.dart';
import 'package:kievit_flutter/views/landing/slide.dart';

class Landing extends StatefulWidget {
  Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final List<Slide> _slides = [
    Slide(
        title: 'Welcome to Kievit',
        description: 'Deskripsi',
        image: 'landing1.png',
        hasButton: false),
    Slide(
        title: 'Welcome to Kievit',
        description: 'Deskripsi',
        image: 'landing2.png',
        hasButton: false),
    Slide(
        title: 'Welcome to Kievit',
        description: 'Deskripsi',
        image: 'landing3.png',
        hasButton: true)
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return outapp(context);
        },
        child: Scaffold(
          body: SafeArea(
              child: Stack(children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: _changePageIndicator,
                  itemCount: _slides.length,
                  itemBuilder: (context, int index) {
                    return _slides[index];
                  },
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {
                              setState(() {
                                _pageController.animateToPage(2,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                              });
                            },
                            child: Text('Skip',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: ColorValues().lightGray))),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List<Widget>.generate(_slides.length, (int index) {
                        return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 7.0,
                            width: (index == _currentPage) ? 14.0 : 7.0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 25.0),
                            decoration: index == _currentPage
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ColorValues().primaryRed)
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: ColorValues().primaryRed)));
                      })),
                ]),
          ])),
        ));
  }

  void _changePageIndicator(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  outapp(BuildContext ctx) {
    SharedCode.showAlertDialog(
        context, 'Exit', 'Do you want to exit?', 'warning',
        onButtonPressed: () {
      exit(0);
    });
  }
}
