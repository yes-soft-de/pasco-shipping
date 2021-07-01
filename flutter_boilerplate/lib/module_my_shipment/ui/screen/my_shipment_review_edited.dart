import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class ReviewShipmentEditedScreen extends StatelessWidget {
  // final MyHistoryShipment shipment;
  const ReviewShipmentEditedScreen();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    ShipmentRequest shipment =arguments['myWaitingShipment'];
    ScrollController controller = ScrollController();
    return Background(
        goBack: (){
          Navigator.pop(context);
        },
        controller: controller,
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child:
                ListTile(title: Text('Shipment type: ' , style: white18text,),
                    subtitle: Text(shipment.transportationType,style: basic14text,))),
              Padding(
                  padding: const EdgeInsetsDirectional.only(end: 20),
                  child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, NewShipmentRoutes.NEW_SHIPMENTS,arguments: {'shipment' : shipment});
                      },
                      child: Icon(Icons.edit , color: AppThemeDataService.AccentColor,)),
                )
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text('Shipment from: ' , style: white18text,), subtitle: Text(shipment.exportWarehouseID.toString() ,style: basic14text,))),
                Expanded(child: ListTile(title: Text('Shipment to: ' , style: white18text,), subtitle: Text( shipment.target,style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text('Product type: ' , style: white18text,), subtitle: Text(shipment.productCategoryName ,style: basic14text,))),
                Expanded(child: ListTile(title: Text('Quantity ' , style: white18text,), subtitle: Text(shipment.quantity.toString() ,style: basic14text,))),
              ],
            ),
            ListTile(title: Text('Supplier Info: ' , style: white18text,), subtitle: Text(shipment.supplierName ,style: basic14text,)),
            Row(
              children: [
                Expanded(
                  child: ListTile(title: Text('Recipient Info: ' ,
                    style: white18text,)),
                ),
                Expanded(child: ListTile(title: Text('Name: ' , style: white18text,), subtitle: Text(shipment.receiverName ,style: basic14text,))),
                Expanded(child: ListTile(title: Text('Phone: ' , style: white18text,), subtitle: Text(shipment.receiverPhoneNumber ,style: basic14text,))),
              ],
            ),
            ListTile(title: Text('Unit: ' , style: white18text,), subtitle: Text(shipment.unit ,style: basic14text,)),
            ListTile(title: Text('Mark ' , style: white18text,), subtitle: Text(shipment.markId.toString() ,style: basic14text,)),
            ListTile(title: Text('Payment time ' , style: white18text,), subtitle: Text(shipment.paymentTime ,style: basic14text,)),
            ListTile(title: Text('Extra specification ' , style: white18text,), subtitle: Text(shipment.extraSpecification ,style: basic14text,)),

          ],
        ), title: S.of(context).reviewShipment,
        currentIndex: -1,
        isHome: false,
        isResultScreen: false);
  }
}