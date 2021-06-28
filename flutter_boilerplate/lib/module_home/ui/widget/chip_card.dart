import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:align_positioned/align_positioned.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ChipCard extends StatelessWidget {
  final String icon;
  final String label;
  final Function() onPressed;
  const ChipCard(
      {required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Stack(children: [
          AlignPositioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppThemeDataService.AccentColor,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              alignment: Alignment.bottomRight,
              touch: Touch.inside,
              dx: 15.0,
              dy: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.black
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(icon),
                  SizedBox(height: 10,),
                  Text(label ,style: white18text)
                ],
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
