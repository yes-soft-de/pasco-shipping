import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_home/response/home_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:align_positioned/align_positioned.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class UserCard extends StatelessWidget {
  final String icon;
  final String label;
  final Users users;

  const UserCard(
      {required this.icon, required this.label , required this.users});
  // HomeCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        color: AppThemeDataService.AccentColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(icon,height: MediaQuery.of(context).size.height*0.03),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(label,style: AppTextStyle.largeWhiteBold,),
                      SizedBox(height: 5,),
                      Text((label == 'Clients' || label == 'العملاء') ? users.customers.toString()+ S.of(context).total : users.employees.toString() + S.of(context).total ,style: AppTextStyle.mediumWhite,)
                    ],)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}


class OrderCard extends StatelessWidget {
  final Orders orders;

  const OrderCard(this.orders);
  // HomeCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        color: AppThemeDataService.AccentColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(StaticImage.box,height: MediaQuery.of(context).size.height*0.04,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(S.of(context).shipment,style: AppTextStyle.largeWhiteBold,),
                      Text(orders.total.toString() + S.of(context).total,style: AppTextStyle.mediumWhite,)
                    ],)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(thickness: 2,color: Colors.white,height: 5,indent: 5,endIndent: 5.0,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Text(S.of(context).waitingShipment , style: AppTextStyle.mediumWhite,),
                    Text(orders.waitingOrders.toString() ,style: AppTextStyle.mediumWhite,),
                  ],),
                  Column(children: [
                    Text(S.of(context).acceptedShipment , style: AppTextStyle.mediumWhite,),
                    Text(orders.acceptedOrders.toString() ,style: AppTextStyle.mediumWhite,),
                  ],),
                ],)

            ],
          ),
        ),
      ),
    );
  }


}

class TravelCard extends StatelessWidget {
  final String name;
  final  Cruise cruise;

  const TravelCard(this.cruise, this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        color: AppThemeDataService.AccentColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset((name=='Flight Travels' || name == 'الرحلات الجوية' )?StaticImage.flight:StaticImage.shipment,height: MediaQuery.of(context).size.height*0.06,),
                    // SizedBox(width: 10,),
                    Column(children: [
                      Text(name,style: AppTextStyle.largeWhiteBold,),
                      Text(cruise.total.toString() + S.of(context).total,style: AppTextStyle.mediumWhite,)
                    ],)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(thickness: 2,color: Colors.white,height: 5,indent: 5,endIndent: 5.0,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Text(S.of(context).arrived , style: AppTextStyle.mediumWhite,),
                    Text(cruise.arrived.toString() ,style: AppTextStyle.mediumWhite,),
                  ],),
                  Column(children: [
                    Text(S.of(context).started , style: AppTextStyle.mediumWhite,),
                    Text(cruise.started.toString() ,style: AppTextStyle.mediumWhite,),
                  ],),
                  Column(children: [
                    Text(S.of(context).currentt, style: AppTextStyle.mediumWhite,),
                    Text(cruise.current.toString() ,style: AppTextStyle.mediumWhite,),
                  ],),
                ],)

            ],
          ),
        ),
      ),
    );
  }


}