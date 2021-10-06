import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/shifting_request.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';

class NewShiftInit extends StatefulWidget {
  final int shipmentID;
  final String trackNumber;
  final List<Countries> warehouses;
  final Function onRequest;
  const NewShiftInit({Key? key,required this.warehouses,required this.onRequest,required this.shipmentID,required this.trackNumber}) : super(key: key);

  @override
  _NewShiftInitState createState() => _NewShiftInitState();
}

class _NewShiftInitState extends State<NewShiftInit> {
  late DropListModel dropListModelFrom;
  late Entry optionItemSelectedF;

  late DropListModel dropListModelTo;
  late Entry optionItemSelectedTo;


  late List<Entry> shippingFrom;
  late List<Entry> shippingTo;
  late String notes = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).shippingFrom,
              style: AppTextStyle.mediumBlackBold,
            ),
            SelectDropListl(
              this.optionItemSelectedF,
              this.dropListModelFrom,
                  (optionItem) {
                optionItemSelectedF = optionItem;
                setState(() {});
              },
            ),
            Text(
              S.of(context).shippingTo,
              style: AppTextStyle.mediumBlackBold,
            ),
            SelectDropListl(
              this.optionItemSelectedTo,
              this.dropListModelTo,
                  (optionItem) {
                optionItemSelectedTo = optionItem;
                setState(() {});
              },
            ),

            TextEdit(hint: S.of(context).importantNote,title:  '', onChange:(info) {
              notes= info;
            }),
            RoundedButton(lable: 'Shift', icon: '', color: blue,
                style: AppTextStyle.mediumWhiteBold, go: (){
                  ShiftingRequest re =ShiftingRequest(trackNumber: widget.trackNumber,shipmentID: widget.shipmentID,fromImportWarehouseID: optionItemSelectedF.id,toImportWarehouseID: optionItemSelectedTo.id,notes:notes );
                  widget.onRequest(re);
                }, radius: 12)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    shippingFrom = <Entry>[];
    shippingTo = <Entry>[];
    optionItemSelectedF = Entry('choose', 0, []);
    optionItemSelectedTo = Entry('choose', 0, []);
    initShippingFrom();
  }
  void initShippingFrom() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.warehouses) {
      if (item.warehouses!.isNotEmpty) {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (Warehouse warehouseItem in item.warehouses!) {
          print(warehouseItem.countryName);
          Entry warehouse = Entry(
              warehouseItem.city! + "/" + warehouseItem.name!,
              warehouseItem.id!, []);
          children.add(warehouse);
        }
        country.children = children;
        shippingFrom.add(country);
        shippingTo.add(country);
      }
    }
    dropListModelFrom = DropListModel(shippingFrom);
    dropListModelTo = DropListModel(shippingTo);
  }
}
