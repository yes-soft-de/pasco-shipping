import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';
import 'package:pasco_shipping/module_unit/widget/unit_card.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/widget/warehouse_card.dart';

class WarehousesSuccessfully extends StatelessWidget {
  final List<WarehousesModel> items;
  final Function onDelete;
  final Function onEdit;
  final Function onShowFinance;
  const WarehousesSuccessfully({required  this.items,required this.onDelete,required this.onEdit,required this.onShowFinance});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return WarehouseCard(model: items[index],
      onEdit: (re){
        onEdit(re);
      },
        onDelete: (id){
        onDelete(id);
        }, isEdtiable: false, onShowFinance: (id){
        onShowFinance(id);
        },
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}
