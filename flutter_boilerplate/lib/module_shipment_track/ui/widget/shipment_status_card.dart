import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_track/model/shipment_status.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ShipmentStatusCard extends StatelessWidget {
  final ShipmentStatus model;
  const ShipmentStatusCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:model.isPrevious  ?  black : (model.isNext ?greyWithMoreOptic :AppThemeDataService.AccentColor) ,
          boxShadow: [
            !model.isPrevious && !model.isNext ?   BoxShadow(
              color: AppThemeDataService.AccentColor,
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 8.0,
              spreadRadius: 8.0,)
                : //BoxShadow
            BoxShadow(
              color: black,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        // color:model.isCurrent  ? AppThemeDataService.AccentColor : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !model.isPrevious && !model.isNext ?  CircleAvatar(
                    backgroundColor: black,
                    child: Icon(Icons.check_circle_outline , color: AppThemeDataService.AccentColor,),) : model.isPrevious ? (Icon(Icons.check_circle_outline ,color: green ,size: 18,)):Container(),
                  SizedBox(width: 5,),
                  Text(model.statusName , style: model.isPrevious ?  white18text :black18text ),
                ],
              ),
              // model.isNext ? Container():Text('1 hour ago' ,style:!(model.isNext || model.isPrevious) ? black14text : greyWhite14text,),

              // Row(
              //   children: [
              //     Icon(Icons.more_vert , color:model.isCurrent ?black : white,),
              //     Text(model.statusName , style: model.isCurrent ? black16text : white16text,),
              //     Spacer(),
              //
              //     // ElevatedButton(
              //     //   style: ElevatedButton.styleFrom(
              //     //       primary:model.isCurrent? AppThemeDataService.AccentColor:black,
              //     //   ),
              //     //   onPressed: (){},
              //     //   child:  Padding(
              //     //     padding: const EdgeInsets.all(5.0),
              //     //     child: Column(
              //     //       children: [
              //     //         Text("we started", style:model.isCurrent ? black14text :greyWhite14text,),
              //     //         Text("20 min ago",style:model.isCurrent ?  black14text :greyWhite14text),
              //     //       ],
              //     //     ),
              //     //   ),)
              //   ],
              // ),
              // Divider(color: white,)

            ],
          ),
        ),
      ),
    );
  }
}