import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_edit_shipment/edit_shipment_routes.dart';
import 'package:pasco_shipping/module_my_shipment/my_shipment_routes.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_active_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';
import 'package:pasco_shipping/module_shipment_previous/previous_routes.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_track/tracking_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ShipmentActiveCard extends StatelessWidget {
  final String image;
  final bool waiting;
  final MyShipment myShipment;

  const ShipmentActiveCard(this.image, this.waiting, this.myShipment);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('nice');
     waiting ? {} :  Navigator.pushNamed(context, TracingRoutes.TRACKING_SCREEN ,arguments: {'trackNumber': myShipment.trackNumber});
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: black,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: Image.asset(image)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5.0,
              ),
              Container(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myShipment.productCategoryName!,
                      style: White14text,
                    ),
                    Row(
                      children: [
                        // waiting
                        //     ?
                        Icon(
                                Icons.more_horiz,
                                color: white,
                                size: 20,
                              ),
                            // : Icon(
                            //     Icons.check_circle_outline,
                            //     color: green,
                            //     size: 20,
                            //   ),
                        SizedBox(
                          width: 2,
                        ),
                        // waiting ?
                        Text(
                          myShipment.shipmentStatus =='stored' ?'in warehouse' :myShipment.shipmentStatus!,
                          style:waiting ? basic10text : greyWhite10text,
                        ),
                        //     : Text(
                        //   'Delivered 1 month ago',
                        //   style: greyWhite10text,
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.info,
                color: white,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShipmentHistoryCard extends StatelessWidget {
  final String image;
  final bool waiting;
  final MyHistoryShipment myShipment;

  const ShipmentHistoryCard(this.image, this.waiting, this.myShipment);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('nice');
        Navigator.pushNamed(context, MyShipmentRoutes.REVIEW_SHIPMENT ,arguments:
        {
          'myHistoryShipment' : myShipment,
          // 'isWaiting':false
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: black,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: Image.asset(image)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5.0,
              ),
              Container(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myShipment.productCategoryName!,
                      style: White14text,
                    ),
                    Row(
                      children: [
                        waiting
                            ? Icon(
                          Icons.more_horiz,
                          color: white,
                          size: 20,
                        )
                            : Icon(
                          Icons.check_circle_outline,
                          color: green,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                       waiting ?   Text(
                         'waiting',
                         style: basic10text,
                       ): Text(
                          myShipment.updatedAt.toString().split(' ').first,
                          style: greyWhite10text,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.info,
                color: white,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class waitingShipmentCard extends StatefulWidget {
  final String image;
  final ShipmentRequest shipmentRequest;

  const waitingShipmentCard(this.image, this.shipmentRequest);

  @override
  _waitingShipmentCardState createState() => _waitingShipmentCardState();
}

class _waitingShipmentCardState extends State<waitingShipmentCard> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, EditShipmentRoutes.REVIEW_EDITED_SHIPMENT, arguments:
        {'myWaitingShipment' : widget.shipmentRequest,
        },);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: black,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: Image.asset(widget.image)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5.0,
              ),
              Container(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.shipmentRequest.productCategoryName,
                      style: White14text,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.more_horiz,
                          color: white,
                          size: 20,
                        ),
                        Text(
                          'waiting',
                          style: greyWhite10text,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {
                _showDialog(context);
               }, child: Text('Confirm' ,style: black14text,),style: ElevatedButton.styleFrom(
                primary: AppThemeDataService.AccentColor,

              ),)
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      text: 'This shipment will be requested',
      backgroundColor:AppThemeDataService.PrimaryColor,
      confirmBtnColor:AppThemeDataService.AccentColor,
      onConfirmBtnTap: (){
      },
    );
  }
}
