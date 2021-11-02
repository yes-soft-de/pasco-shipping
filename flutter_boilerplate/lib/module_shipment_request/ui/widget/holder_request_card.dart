import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class RequestHolderCard extends StatelessWidget {
  final RequestedHolders requestHolder;
  const RequestHolderCard({required this.requestHolder});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow.shade900,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // <-- Radius
      ),
      child:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          requestHolder.name!.isNotEmpty ?Row(children: [
            Text(S.of(context).type+': ',style: black18text),
            Text(requestHolder.name??'',style:white18text,)
          ],):Container(),
          SizedBox(height: 15,),
          Row(children: [
            Text(S.of(context).importantNote+': ',style: black18text),
            Expanded(child: Text(requestHolder.notes ??'' , style: white18text))
          ],),
          SizedBox(height: 15,),
          Row(children: [
            Text(S.of(context).importHarbor+': ',style: black18text),
            Expanded(child: Text(requestHolder.portName ??'' , style: white18text))
          ],),
          SizedBox(height: 15,),
          Row(children: [
            Text(S.of(context).exportHarbor+': ',style: black18text),
            Expanded(child: Text(requestHolder.exportPortName ??'' , style: white18text))
          ],),
          SizedBox(height: 15,),
          Row(children: [
            Text(S.of(context).carrier+': ',style: black18text),
            Expanded(child: Text(requestHolder.carrierName ??'' , style: white18text))
          ],),
        ],),
      ),);
  }
}
