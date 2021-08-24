import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/select_warehouse_card.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';

class SelectWarehousesSuccessfully extends StatelessWidget {
  final List<WarehousesModel> items;
  final Function goToAcceptedShipment;


  const SelectWarehousesSuccessfully({required  this.items,required this.goToAcceptedShipment,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return SelectWarehouseCard(
       model:  items[index],
        goToAcceptedShipment:(id){
         goToAcceptedShipment(id);
        } ,
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}