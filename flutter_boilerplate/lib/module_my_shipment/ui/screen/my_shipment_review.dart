import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/screen/image_full_screen.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/holder_request_card.dart';
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
    print(shipment.imagePath);
    return Background(
      goBack: (){
        Navigator.pop(context);
      },
        controller: controller,
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child:
                  ListTile(title: Text(S.of(context).shippingWay , style: white18text,),
                    subtitle: Text(shipment.transportationType?? '' ,style: basic14text,))),
                Expanded(child:
                ListTile(title: Text(S.of(context).shipmentID , style: white18text,),
                    subtitle: Text(shipment.shipmentId.toString() ,style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text(S.of(context).shippingFrom , style: white18text,), subtitle: Text(shipment.exportWarehouseName??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text(S.of(context).shippingTo , style: white18text,), subtitle: Text( shipment.target??'',style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text(S.of(context).isExternalWarehouse , style: white18text,), subtitle: Text(shipment.isExternalWarehouse.toString() ,style: basic14text,))),
                Expanded(child: ListTile(title: Text(S.of(context).externalWarehouseInfo , style: white18text,), subtitle: Text( shipment.externalWarehouseInfo??'',style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text(S.of(context).category , style: white18text,), subtitle: Text(shipment.productCategoryName??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text(S.of(context).subCategory , style: white18text,), subtitle: Text(shipment.subProductCategoryName.toString() ,style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text(S.of(context).quantity , style: white18text,), subtitle: Text(shipment.quantity.toString() ,style: basic14text,))),
                Expanded(child: ListTile(title: Text(S.of(context).holderCount , style: white18text,), subtitle: Text( shipment.holderCount.toString(),style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text(S.of(context).supplierInfo , style: white18text,), subtitle: Text(shipment.supplierName??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text(S.of(context).serialNumber , style: white18text,), subtitle: Text(shipment.clientIdentificationNumber??'' ,style: basic14text,))),
              ],
            ),

            Row(
              children: [
                Expanded(child: ListTile(title: Text(S.of(context).unit , style: white18text,), subtitle: Text(shipment.unit??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text(S.of(context).mark , style: white18text,), subtitle: Text(shipment.markNumber??'' ,style: basic14text,))),
              ],
            ),
            Row(
              children: [
                Expanded(child: ListTile(title: Text(S.of(context).paymentTime , style: white18text,), subtitle: Text(shipment.paymentTime??'' ,style: basic14text,))),
                Expanded(child: ListTile(title: Text(S.of(context).extraSpecification , style: white18text,), subtitle: Text(shipment.extraSpecification??'' ,style: basic14text,))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(S.of(context).holder ,style: white18text),
            ),
            shipment.holders.isEmpty?Container() :
                ListView.builder(itemBuilder: (context ,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RequestHolderCard(requestHolder: shipment.holders[index],),
                  );
                },
                  shrinkWrap: true,
                  itemCount: shipment.holders.length,
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).attached ,style: white18text),
            ),
            shipment.imagePath!.isEmpty?Container(): GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(shipment.imagePath!.length, (index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FullImageScreen(shipment.imagePath![index].url , false)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                      child: Image.network(
                        shipment.imagePath![index].url,
                        fit: BoxFit.fill,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  );
                })
            ),
          ],
        ), title: S.of(context).reviewShipment,
        currentIndex: -1,
        isHome: false,
        isResultScreen: false);
  }
}