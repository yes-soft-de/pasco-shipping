import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_track/response/tracking_response.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class HolderInfoCard extends StatelessWidget {
  final Track track;
  const HolderInfoCard(this.track);


  @override
  Widget build(BuildContext context) {
    HolderInfo info;
    if(track.holderInfo == null){
      info =HolderInfo(status: 'empty' ,identificationNumber: 'empty');
    }else {
      info =HolderInfo(status: track.holderInfo!.status ,identificationNumber: track.holderInfo!.identificationNumber);
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        ListTile(title: Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 8),
          child: Text(track.holderType ?? '',style: black18text,),
        ),
          subtitle: Column(
          children: [
            Row(children: [
              Text('holder number: ' ,style: black14text,),
              Text(info.identificationNumber??'empty')
            ],),
            Row(children: [
              Text('status: ',style: black14text,),
              Text(info.status??'empty')
            ],),
          ],
        ),
        ),
      ],),
    );
  }
}
