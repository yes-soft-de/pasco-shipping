import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';

class MarkFirstTime extends StatefulWidget {
  final List<ClientModel> clients;
  final Function onClientSelect;
  const MarkFirstTime({required this.clients,required this.onClientSelect});

  @override
  _MarkFirstTimeState createState() => _MarkFirstTimeState();
}

class _MarkFirstTimeState extends State<MarkFirstTime> {
  late DropListModel dropListModelClient;
  late Entry optionItemSelectedClient ;
  late List<Entry> client;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(StaticImage.mark),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).clients,
              style: AppTextStyle.largeBlackBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectDropList(
              this.optionItemSelectedClient,
              this.dropListModelClient,
                  (optionItem) {
                optionItemSelectedClient = optionItem;
                widget.onClientSelect(optionItem);
                // widget.shipmentRequest.exportWarehouseID =optionItem.id;
                // widget.shipmentRequest.exportWarehouseName =optionItem.title;
                // print("nameWear"  +  optionItem.title);
                // setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    client = <Entry>[];
    optionItemSelectedClient =  Entry('choose', 1, []);

    for(ClientModel item in widget.clients){
      Entry v = Entry(item.userName! ,item.id! ,[]);
      client.add(v);
    }
    dropListModelClient = DropListModel(client);
  }
}