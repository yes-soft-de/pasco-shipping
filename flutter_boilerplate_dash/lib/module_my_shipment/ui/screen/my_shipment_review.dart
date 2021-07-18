import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class ReviewShipmentScreen extends StatelessWidget {
  // final MyHistoryShipment shipment;
  const ReviewShipmentScreen();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    MyHistoryShipment shipment =arguments['myHistoryShipment'];
    ScrollController controller = ScrollController();
    return Background(
      goBack: (){
        Navigator.pop(context);
      },
        // controller: controller,
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child:
                  ListTile(title: Text('Shipment type: ' , style: white18text,),
                    subtitle: Text(shipment.transportationType?? '' ,style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text('Shipment from: ' , style: white18text,), subtitle: Text(shipment.exportWarehouseName??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text('Shipment to: ' , style: white18text,), subtitle: Text( shipment.target??'',style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text('Product type: ' , style: white18text,), subtitle: Text(shipment.productCategoryName??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text('Quantity ' , style: white18text,), subtitle: Text(shipment.quantity.toString() ,style: basic14text,))),
              ],
            ),
            ListTile(title: Text('Supplier Info: ' , style: white18text,), subtitle: Text(shipment.supplierName??'' ,style: basic14text,)),
            Row(
              children: [
                Expanded(
                  child: ListTile(title: Text('Recipient Info: ' ,
                    style: white18text,)),
                ),
                Expanded(child: ListTile(title: Text('Name: ' , style: white18text,), subtitle: Text(shipment.receiverName??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text('Phone: ' , style: white18text,), subtitle: Text(shipment.receiverPhoneNumber??'' ,style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(children: [
                    ListTile(title: Text('Unit: ' , style: white18text,), subtitle: Text(shipment.unit??'' ,style: basic14text,)),
                    ListTile(title: Text('Mark ' , style: white18text,), subtitle: Text(shipment.markNumber??'' ,style: basic14text,)),
                    ListTile(title: Text('Payment time ' , style: white18text,), subtitle: Text(shipment.paymentTime??'' ,style: basic14text,)),
                    ListTile(title: Text('Extra specification ' , style: white18text,), subtitle: Text(shipment.extraSpecification??'' ,style: basic14text,)),
                  ],),
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(color: AppThemeDataService.AccentColor)
                          ]),
                      child:
                      // shipment.imagePath != null
                      //     ? Image.network(
                      //   shipment.imagePath!,
                      //   fit: BoxFit.cover,
                      //   width: 100,
                      //   height: 100,
                      // )
                      //     :
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt),
                          iconSize: 50.0,
                          onPressed: () {},
                        ),
                      ),
                    ))
              ],
            ),


          ],
        ), title: S.of(context).reviewShipment,
        // currentIndex: -1,
        // isHome: false,
        // isResultScreen: false
    );
  }
}