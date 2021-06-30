import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class SecondOptionSuccessfully extends StatefulWidget {
 final List<Mark> marks;
 final ShipmentRequest _shipmentRequest;
  const SecondOptionSuccessfully(this.marks, this._shipmentRequest);

  @override
  _SecondOptionSuccessfullyState createState() => _SecondOptionSuccessfullyState();
}

class _SecondOptionSuccessfullyState extends State<SecondOptionSuccessfully> {
  DropListModel dropListModelUnit = DropListModel(dataUnit);

  late DropListModel dropListModelMark ;
  late List<Entry> marksEntry;

  late Entry optionItemSelectedU = Entry('choose', 1,[]);
  late Entry optionItemSelectedMar = Entry('choose', 1,[]);


  @override
  void initState() {
    super.initState();
    marksEntry = <Entry>[];
    for(Mark item in widget.marks){
      Entry v = Entry(item.markNumber! ,item.id! ,[]);
      marksEntry.add(v);
    }
    dropListModelMark = DropListModel(marksEntry);
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Supplier Info : ',
          style: white18text,
        ),
        TextEdit('name here', 50,(supplierName){
          widget._shipmentRequest.supplierName =supplierName;
        }),
        SizedBox(
          height: 25,
        ),
        Text(
          'Recipient Info : ',
          style: white18text,
        ),
        TextEdit('name here', 50,(receiverName){
          widget._shipmentRequest.receiverName =receiverName;
        }),
        TextEdit('phone number', 50,(receiverPhoneNumber){
          int number = int.parse(receiverPhoneNumber);
          widget._shipmentRequest.receiverPhoneNumber = number;
        }),
        SizedBox(
          height: 15,
        ),
        Text(
          'Unit : ',
          style: white18text,
        ),
        SelectDropList(
          this.optionItemSelectedU,
          this.dropListModelUnit,
              (optionItem) {
            optionItemSelectedU = optionItem;
            widget._shipmentRequest.unit =optionItem.title;
            setState(() {});
          },
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Mark : ',
          style: white18text,
        ),
        Row(
          children: [
            Expanded(
              child: SelectDropList(
                this.optionItemSelectedMar,
                this.dropListModelMark,
                    (optionItem) {
                  optionItemSelectedMar = optionItem;
                  widget._shipmentRequest.markId =optionItem.id;
                  setState(() {});
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MarkRoutes.mark);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_circle_outline_sharp,
                      color: AppThemeDataService.AccentColor,
                      size: 25,
                    ),
                    Text(
                      'add\nnew',
                      style: White14text,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
