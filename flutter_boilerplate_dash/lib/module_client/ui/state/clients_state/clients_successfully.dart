import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_client/widget/client_card.dart';

class ClientsSuccessfully extends StatelessWidget {
  final List<ClientModel> items;
  final Function onDelete;
  final Function onEdit;
  const ClientsSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return ClientCard(model: items[index],
        onEdit: (re){
          // onEdit(re);
        },
        onDelete: (id){
          // onDelete(id);
        }
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}