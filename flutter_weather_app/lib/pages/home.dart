import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterweatherapp/api/own_api.dart';
import 'package:flutterweatherapp/util/responsive.dart';
import 'package:flutterweatherapp/widget/weather_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Responsive responsive;
  var _temp=0.0, _temp_max=0.0, _temp_min=0.0, _humidity=0, _clouds=0, _wind=0.0;
  var _icon="";
  var _isFetching=false;
  IconData _weatherIcon=Icons.cloud;

  _getWeather() async{
    setState(() {
      _isFetching=true;
    });
    OpenWeatherMapAPI openWeatherMapAPI=OpenWeatherMapAPI();
    final response=await openWeatherMapAPI.getMexicoCityWeather();

    setState(() {
      _isFetching=false;
    });
    if(response!=null){
      setState(() {
        _temp=response['list'][0]['main']['temp'];
        _icon=response['list'][0]['weather'][0]['icon'];
        _temp_max=response['list'][0]['main']['temp_max'];
        _temp_min=response['list'][0]['main']['temp_min'];
        _humidity=response['list'][0]['main']['humidity'];
        _clouds=response['list'][0]['clouds']['all'];
        _wind=response['list'][0]['wind']['speed'];
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: responsive.hp(5),),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(responsive.wp(100))),
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                      child: Container(
                        padding: EdgeInsets.all(responsive.ip(2)),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                (_icon=="")?
                                Icon(_weatherIcon, size: responsive.ip(8),):
                                Image.network("http://openweathermap.org/img/wn/$_icon@2x.png", width: responsive.ip(8), height: responsive.ip(8),),
                                SizedBox(width: responsive.hp(5),),
                                Text("°$_temp", style: GoogleFonts.quicksand(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: responsive.ip(6))),),
                                Text("°$_temp_min/°$_temp_max", style: GoogleFonts.quicksand(),),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: responsive.hp(2),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.location_on),
                        Text("Mexico City", style: GoogleFonts.quicksand(textStyle: TextStyle(fontSize: responsive.ip(4), fontWeight: FontWeight.bold)),)
                      ],),
                    SizedBox(height: responsive.hp(2),),

                    Text("Details",style: GoogleFonts.quicksand(fontWeight: FontWeight.bold, fontSize: responsive.ip(3)),),
                    SizedBox(height: responsive.hp(2),),
                    Container(
                      width: responsive.wp(100),
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
                      child: WeatherDetailWidget(
                        responsive,
                        icon: EvaIcons.droplet,
                        text: "Humidity: ${_humidity}%",
                        containerColor: Color(0xffB2EBF2),
                        textColor: Colors.black,
                        iconColor: Color(0xff0097A7),
                        iconContainerColor: Color(0xff4DD0E1),
                      ),
                    ),
                    SizedBox(height: responsive.hp(1),),
                    Container(
                      width: responsive.wp(100),
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
                      child: WeatherDetailWidget(
                        responsive,
                        icon: Icons.cloud,
                        text: "Clouds: ${_clouds}%",
                        containerColor: Color(0xffF5F5F5),
                        textColor: Colors.black,
                        iconColor: Color(0xff616161),
                        iconContainerColor: Color(0xffE0E0E0),
                      ),
                    ),
                    SizedBox(height: responsive.hp(1),),
                    Container(
                      width: responsive.wp(100),
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
                      child: WeatherDetailWidget(
                        responsive,
                        icon: EvaIcons.flip,
                        text: "Wind: ${_wind}km/h",
                        containerColor: Color(0xffB2DFDB),
                        textColor: Colors.black,
                        iconColor: Color(0xff00796B),
                        iconContainerColor: Color(0xff26A69A),
                      ),
                    ),

                  ],
                ),

                _isFetching? Positioned.fill(
                    top: 0,
                    left: 0,
                    child: Container(
                      color: Colors.black45,
                      child: Container(
                        child: CupertinoActivityIndicator(radius: 15,),
                      ),
                    )):SizedBox(),
              ],
            )
        ),
      ),
    );
  }
}