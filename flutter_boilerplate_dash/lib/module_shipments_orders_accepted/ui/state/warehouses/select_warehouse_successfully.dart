import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/select_warehouse_card.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';

class SelectWarehousesSuccessfully extends StatefulWidget {
  final List<WarehousesModel> items;
  final Function goToAcceptedShipment;


  const SelectWarehousesSuccessfully({required  this.items,required this.goToAcceptedShipment,});

  @override
  _SelectWarehousesSuccessfullyState createState() => _SelectWarehousesSuccessfullyState();
}

class _SelectWarehousesSuccessfullyState extends State<SelectWarehousesSuccessfully> {
  // Copy Main List into New List.
 late List<WarehousesModel> newDataList ;
 late List<WarehousesModel> mainDataList ;


late TextEditingController _textController ;


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();

    newDataList = List.from(widget.items);
    mainDataList = List.from(widget.items);
  }
 void onItemChanged(String value) {
   setState(() {
     newDataList = mainDataList
         .where((string) => string.name!.toLowerCase().contains(value.toLowerCase()))
         .toList();
   });
 }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: S.of(context).searchHere,
                icon: Icon(Icons.search_outlined)
              ),
              onChanged: onItemChanged,
            ),
          ),
          ListView.builder(itemBuilder: (context , index){
            return SelectWarehouseCard(
             model: newDataList[index],
              goToAcceptedShipment:(id){
               widget.goToAcceptedShipment(id);
              } ,
            );
          },itemCount: newDataList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    )
    ;
  }
}