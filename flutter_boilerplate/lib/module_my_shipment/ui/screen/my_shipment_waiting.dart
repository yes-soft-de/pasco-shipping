import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class MyShipmentWaiting extends StatefulWidget {
  const MyShipmentWaiting();

  @override
  _MyShipmentWaitingState createState() => _MyShipmentWaitingState();
}

class _MyShipmentWaitingState extends State<MyShipmentWaiting> {
 late ShipmentTempRequest shipmentRequest;
 late bool isEmptyData;


 @override
  void initState() {
   super.initState();
   isEmptyData= false;
   shipmentRequest = ShipmentTempRequest(
       '', 0,'', '', 0, '',0, '', '', '', '', 0, '', '', '','','',false,'',null);
  }

 @override
  void didChangeDependencies() {
   super.didChangeDependencies();
   getShipmentt();

  }

  void getShipmentt() async {
   await getShipment().then((value) {
      if(value == null){
        setState(() {
          isEmptyData = true;
        });
      }
      else {
        setState(() {
          shipmentRequest = value;
          isEmptyData = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  isEmptyData ?Center(child: Text('No Shipment waiting for confirmation',style: greyWhite14text,),):
      Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 20, top: 10),
                child: Text(
                  'Shipment waiting for confirmation',
                  style: greyWhite14text,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return waitingShipmentCard(StaticImage.box,shipmentRequest);
                  }),
            ],
          ),
        );
  }
}
