import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';
import 'package:pasco_shipping/module_product_sub_category/widget/sub_product_card.dart';

class SubProductsSuccessfully extends StatelessWidget {
  final List<SubProductModel> items;
  final Function onDelete;
  final Function onEdit;
  const SubProductsSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return SubProductCard(model: items[index],
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
