import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_suppliers/response/suppliers_response.dart';
import 'package:pasco_shipping/module_suppliers/widget/supplier_card.dart';

class SuppliersSuccessfully extends StatelessWidget {
  final List<SupplierModel> items;
  final Function onDelete;
  final Function onEdit;
  const SuppliersSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return SupplierCard(model: items[index],
      onEdit: (re){
        onEdit(re);
      },
        onDelete: (id){
        onDelete(id);
        }, isEdtiable: false,
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}
