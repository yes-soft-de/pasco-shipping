import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';

class AcceptedShipmentStatusCard extends StatelessWidget {
  final AcceptedShipmentStatusModel model;
  const AcceptedShipmentStatusCard(this.model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:(model.isPassed) ? Colors.blue[900]: Colors.grey ,
        ),
        // color:model.isCurrent  ? AppThemeDataService.AccentColor : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 model.isPassed ? Icon(Icons.check_circle ,color: Colors.green):Container(),
                  SizedBox(width: 10,),
                  Expanded(child: Text(model.shipmentStatus ??'' , style: model.isPassed ?  AppTextStyle.largeGreenBold :AppTextStyle.mediumWhite )),
                ],
              ),
              model.isPassed ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(S.of(context).updatedAt,style:AppTextStyle.mediumWhiteBold),
                    Text(model.createdAt.toString().split('.').first, style:AppTextStyle.mediumWhite),
                  ],
                ),
              ): Container(),
              model.isPassed ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(S.of(context).updatedBy,style:AppTextStyle.mediumWhiteBold),
                    Text(model.createdByUser  ??'', style:AppTextStyle.mediumWhite),
                  ],
                ),
              ): Container()

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
