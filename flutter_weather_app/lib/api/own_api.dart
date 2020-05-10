import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutterweatherapp/configapp.dart';
import 'package:http/http.dart' as http;

class OpenWeatherMapAPI{
  Future<dynamic> getMexicoCityWeather() async{
    try{
      final mexicoCityID="3530597";
      final url="http://api.openweathermap.org/data/2.5/forecast?id=$mexicoCityID&units=metric&appid=${ConfigApp.openWeatherAppID}";

      final response=await http.get(url);
      final parsed=jsonDecode(response.body);

    if(response.statusCode==200){
      return parsed;
    }
    throw PlatformException(code: "201", message: "Error when calling API");
    }on PlatformException catch(e){
      print("Error getting mexico city info: ${e.message}");
      return null;
    }
  }
}