import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_previous/previous_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:align_positioned/align_positioned.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ShipmentCard extends StatelessWidget {
  final String image;
  final bool waiting;

  const ShipmentCard(this.image, this.waiting);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('nice');
       waiting ? Navigator.pushNamed(context, PreviousShipmentsRoutes.RESULT_TRACKING_SHIPMENTS ,  arguments: {'isWaiting': false},) :
        Navigator.pushNamed(context, PreviousShipmentsRoutes.REVIEW_SHIPMENTS ,  arguments: {'isWaiting': false},);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cars shipments',
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
                      waiting ?Text(
                        'waiting',
                        style: greyWhite10text,
                      ): Text(
                        'Delivered 1 month ago',
                        style: greyWhite10text,
                      )
                    ],
                  ),
                ],
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

  const waitingShipmentCard(this.image);

  @override
  _waitingShipmentCardState createState() => _waitingShipmentCardState();
}

class _waitingShipmentCardState extends State<waitingShipmentCard> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, PreviousShipmentsRoutes.REVIEW_SHIPMENTS ,  arguments: {'isWaiting': true},);
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cars shipments',
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
