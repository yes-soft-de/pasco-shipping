import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';

class RequestHolderCard extends StatelessWidget {
  final RequestedHolders requestHolder;
  const RequestHolderCard({required this.requestHolder});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // <-- Radius
      ),
      child:
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        Row(children: [
          Text(S.of(context).type+': ',style: AppTextStyle.mediumBlackBold),
          Text(requestHolder.name,style: AppTextStyle.mediumWhiteBold,)
        ],),
        SizedBox(height: 15,),
        Row(children: [
          Text(S.of(context).importantNote+': ',style: AppTextStyle.mediumBlackBold),
          Expanded(child: Text(requestHolder.notes ??'' , style: AppTextStyle.mediumWhiteBold,))
        ],),
      ],),
    ),);
  }
}
