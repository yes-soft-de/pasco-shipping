import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_subcontract_services/widget/sub_contract_service_card.dart';

class SubContractServiceSuccessfully extends StatelessWidget {
  final List<SubContractServiceModel> items;
  final Function onDelete;
  final Function onEdit;
  const SubContractServiceSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return SubContractServiceCard(model: items[index],
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
