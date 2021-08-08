import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedButton extends StatelessWidget {
  final String lable;
  final String icon;
  final Color color;
  final TextStyle style;
  final Function go;
  final double radius;

  const RoundedButton(
      {required this.lable, required this.icon, required this.color, required this.style,required this.go,required this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          go();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon.isEmpty?Container(): Padding(
                  padding: const EdgeInsetsDirectional.only(end: 20),
                  child: Image.asset(
                    icon,
                  ),
                ),
                Text(lable , style: style,),
              ],
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius), // <-- Radius
          ),

        ),
      ),
    );
  }
}
