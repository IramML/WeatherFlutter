import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterweatherapp/util/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    Timer timer=Timer(Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(context, "home", (_)=>false);
    });
    final responsive=Responsive(context);
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset("assets/splash_icon.svg", height: responsive.ip(18), width: responsive.ip(18), ),
              SizedBox(height: responsive.hp(2),),
              Text("Weather App", maxLines: 1,
                style: GoogleFonts.cookie(textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: responsive.ip(6),
                )),
              ),
              SizedBox(height: responsive.hp(2),),
              CupertinoActivityIndicator(
                radius: 15,
              )
            ],
          ),
      ),
    );
  }
}
