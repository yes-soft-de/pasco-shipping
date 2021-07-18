import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_distributors/widget/distributor_card.dart';

class DistributorsSuccessfully extends StatelessWidget {
  final List<DistributorModel> items;
  final Function onDelete;
  final Function onEdit;
  const DistributorsSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return DistributorCard(model: items[index],
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
