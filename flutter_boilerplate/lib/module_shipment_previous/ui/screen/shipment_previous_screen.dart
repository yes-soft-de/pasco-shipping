import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_home/ui/widget/chip_card.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/search_card.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:align_positioned/align_positioned.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class ShipmentPreviousScreen extends StatelessWidget {
  const ShipmentPreviousScreen();

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return  Background(
      controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20,top: 20),
                child: Text('Result of previous shipment' ,style: white30text,),
              ),
              SearchCard(),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 20 ,start: 20),
                child: Divider(thickness: 2,color: white,),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20,top: 10),
                child: Text('Recent shipment' ,style: greyWhite14text,),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:20,
                  itemBuilder: (context , index){
                return ShipmentCard(StaticImage.car,false);
              }),
            ],
          ),
          title: 'Previous shipments',
      currentIndex: -1,
      isResultScreen: false,
      isHome: false,

    );
  }
}
