import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class HolderCard extends StatelessWidget {
  final PendingHolders pendingHolders;
  const HolderCard({required this.pendingHolders});

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
            Text(pendingHolders.specificationName ??'',style: AppTextStyle.mediumWhiteBold,)
          ],),
          SizedBox(height: 15,),
          Row(children: [
            Text(S.of(context).importantNote+': ',style: AppTextStyle.mediumBlackBold),
            Expanded(child: Text(pendingHolders.notes ??'' , style: AppTextStyle.mediumWhiteBold,))
          ],),
        ],),
      ),);
  }
}