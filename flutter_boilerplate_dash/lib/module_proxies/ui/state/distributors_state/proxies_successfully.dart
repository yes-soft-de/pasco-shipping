import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_proxies/widget/proxy_card.dart';

class ProxiesSuccessfully extends StatelessWidget {
  final List<ProxyModel> items;
  final Function onDelete;
  final Function onEdit;
  const ProxiesSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return ProxyCard(model: items[index],
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
