import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterweatherapp/api/own_api.dart';
import 'package:flutterweatherapp/util/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Responsive responsive;
  var _temp=0.0, _icon="";
  IconData _weatherIcon=Icons.cloud;

  _getWeather() async{
    OpenWeatherMapAPI openWeatherMapAPI=OpenWeatherMapAPI();
    final response=await openWeatherMapAPI.getMexicoCityWeather();

    if(response!=null){
      setState(() {
        print(response.toString());
        _temp=response['list'][0]['main']['temp'];
        _icon=response['list'][0]['weather'][0]['icon'];
      });
    }else{

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWeather();
  }

  @override
  Widget build(BuildContext context) {
    responsive=Responsive(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: responsive.hp(4),),
            Card(
              margin: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("°$_temp", style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.ip(6))),),
                      SizedBox(width: responsive.wp(5),),
                      (_icon=="")?Icon(_weatherIcon, size: responsive.ip(16),):Image.network("http://openweathermap.org/img/wn/$_icon@2x.png"),
                    ],
                  ),
                  SizedBox(height: responsive.hp(4),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text("Mexico City", style: GoogleFonts.quicksand(textStyle: TextStyle(fontSize: responsive.ip(4), fontWeight: FontWeight.bold)),)
                    ],),
                  SizedBox(height: responsive.hp(4),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
