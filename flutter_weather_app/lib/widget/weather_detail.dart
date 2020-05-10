import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterweatherapp/util/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDetailWidget extends StatefulWidget {
  Responsive responsive;
  Color containerColor, iconContainerColor, iconColor, textColor;
  var text;
  IconData icon;


  WeatherDetailWidget(this.responsive,{@required this.containerColor,
    @required this.iconContainerColor, @required this.iconColor, @required this.textColor, @required this.text,
    @required this.icon});

  @override
  _WeatherDetailWidgetState createState() => _WeatherDetailWidgetState();
}

class _WeatherDetailWidgetState extends State<WeatherDetailWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.containerColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.responsive.ip(10))),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(widget.responsive.wp(2)),
              decoration: BoxDecoration(
                  color: widget.iconContainerColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Icon(widget.icon,
                    color: widget.iconColor,
                    size: widget.responsive.ip(4) //35,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                widget.text,
                style: GoogleFonts.quicksand(textStyle: TextStyle(
                  fontSize: widget.responsive.ip(2), //20,
                  color: widget.textColor,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Container(
      decoration: BoxDecoration(
          color: widget.containerColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(widget.responsive.wp(2)),
            decoration: BoxDecoration(
                color: widget.iconContainerColor,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Icon(widget.icon,
                  color: widget.iconColor,
                  size: widget.responsive.ip(4) //35,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              widget.text,
              style: GoogleFonts.quicksand(textStyle: TextStyle(
                fontSize: widget.responsive.ip(2), //20,
                color: widget.textColor,)),
            ),
          )
        ],
      ),
    );
*/

