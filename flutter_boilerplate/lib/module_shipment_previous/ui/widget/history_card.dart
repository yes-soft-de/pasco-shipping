import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class historyCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final bool isActive;
  final Function onTap;
  const historyCard(this.title, this.subTitle, this.image, this.isActive, this.onTap);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width *0.3,
        child: Card(
          color: isActive ? AppThemeDataService.AccentColor : black ,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(image , color: isActive ?black  : white ,width: 18,height: 18,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(title ,style: isActive? black14text:  White14text ),
                      Text(subTitle , style:isActive? black14text :White14text )
                    ],),
                  )

                ],
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
        ),
      ),
    );
  }
}
