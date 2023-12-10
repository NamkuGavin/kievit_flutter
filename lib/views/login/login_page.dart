import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kievit_flutter/model/user_model.dart';
import 'package:kievit_flutter/network/login_api.dart';
import 'package:kievit_flutter/page/home.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:kievit_flutter/shared/shared_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _passwordShow = true;
  bool _isLoading = false;
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return outapp(context);
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Spacer(),
                            Image.asset(
                              'assets/circle1.png',
                              width: MediaQuery.of(context).size.height * 0.5,
                              height: MediaQuery.of(context).size.height * 0.5,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/circle2.png',
                              width: MediaQuery.of(context).size.width * 0.47,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(child: _buildContent(context)),
                _isLoading
                    ? Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        ));
  }

  Padding _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Image.asset(
              'assets/logo_kievit.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          _buildLoginForm(context)
        ],
      ),
    );
  }

  Container _buildLoginForm(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width * 0.45,
        padding: EdgeInsets.only(right: 25, left: 25),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  'Login to Your Account',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextFormField(
                validator: SharedCode.emptyValidator,
                controller: _userController,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: ColorValues().hintTextField),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/user_icon.svg',
                    ),
                    suffixIconConstraints:
                        BoxConstraints(minHeight: 10, minWidth: 10),
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1.0)),
                    hintText: "Type Your Username",
                    hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorValues().hintTextField)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextFormField(
                validator: SharedCode.emptyValidator,
                controller: _passController,
                obscureText: _passwordShow,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: ColorValues().hintTextField),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordShow = !_passwordShow;
                          });
                        },
                        child: _passwordShow
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )),
                    suffixIconConstraints:
                        BoxConstraints(minHeight: 10, minWidth: 10),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1.0)),
                    hintText: "Type Your Password",
                    hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorValues().hintTextField)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 12, color: ColorValues().primaryRed),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: Text('Sign In'))
            ],
          ),
        ));
  }

  outapp(BuildContext ctx) {
    SharedCode.showAlertDialog(
        context, 'Exit', 'Do you want to exit?', 'warning',
        onButtonPressed: () {
      exit(0);
    });
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = !_isLoading;
    });
    if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
      UserModel result = await LoginApi().postLogin(
          username: _userController.text, password: _passController.text);
      if (result.accesToken.isNotEmpty) {
        setState(() {
          _isLoading = false;
        });
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', result.accesToken);
        prefs.setString('user', _userController.text);
        prefs.setString('password', _passController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext c) => Home()));
      }
    }
  }
}
