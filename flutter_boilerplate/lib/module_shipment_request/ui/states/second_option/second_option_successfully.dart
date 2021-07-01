import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class SecondOptionSuccessfully extends StatefulWidget {
  final List<Mark> marks;
  final ShipmentRequest shipmentRequest;
  final Function goBackStep;
  final Function goNextPage;
  SecondOptionSuccessfully({required this.marks,required this.shipmentRequest,required this.goBackStep,required this.goNextPage});

  @override
  _SecondOptionSuccessfullyState createState() => _SecondOptionSuccessfullyState();
}

class _SecondOptionSuccessfullyState extends State<SecondOptionSuccessfully> {
  DropListModel dropListModelUnit = DropListModel(dataUnit);

  late DropListModel dropListModelMark;
  late List<Entry> marksEntry;

  late Entry optionItemSelectedU;
  late Entry optionItemSelectedMar;

  late String supplierName;
  late String receiverName;
  late String receiverPhone;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(widget.shipmentRequest.markId !=0){
      for(Mark item in widget.marks){
        if(item.id == widget.shipmentRequest.markId) {
          optionItemSelectedMar = Entry(item.markNumber!, item.id!, []);
        }
      }
    }else {
      optionItemSelectedMar =  Entry('choose', 1, []);
    }

    if(widget.shipmentRequest.supplierName.isNotEmpty){
      supplierName = widget.shipmentRequest.supplierName;
    }else{
      supplierName=S.of(context).nameHere;
    }

    if(widget.shipmentRequest.receiverName.isNotEmpty){
      receiverName = widget.shipmentRequest.receiverName;
    }else{
      receiverName=S.of(context).nameHere;
    }

    if(widget.shipmentRequest.receiverPhoneNumber.isNotEmpty){
      receiverPhone = widget.shipmentRequest.receiverPhoneNumber;
    }else{
      receiverPhone=S.of(context).phone;
    }


    if(widget.shipmentRequest.unit.isNotEmpty){
      optionItemSelectedU = Entry(widget.shipmentRequest.unit, 1, []);
    }else{
      optionItemSelectedU=Entry('choose', 1, []);
    }

  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Supplier Info : ',
          style: white18text,
        ),
        TextEdit(supplierName, 50, (supplierName) {
          widget.shipmentRequest.supplierName = supplierName;
        }),
        SizedBox(
          height: 25,
        ),
        Text(
          'Recipient Info : ',
          style: white18text,
        ),
        TextEdit(receiverName, 50, (receiverName) {
          widget.shipmentRequest.receiverName = receiverName;
        }),
        TextEdit(receiverPhone, 50, (receiverPhoneNumber) {
          widget.shipmentRequest.receiverPhoneNumber = receiverPhoneNumber;
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
            widget.shipmentRequest.unit = optionItem.title;
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
                  widget.shipmentRequest.markId = optionItem.id;
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
            ),


          ],
        ),
        Row(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            widget.goBackStep();
                          },
                          label: Text('Back'),
                          icon: Icon(
                            Icons.arrow_back,
                          ),
                        )),

                  ],
                ),
              ),
            ),
            Spacer(),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    widget.goNextPage();
                  },
                  icon: Icon(
                    Icons.arrow_forward_outlined,
                  ),
                  label: Text('Continue'),
                )),
          ],
        )

      ],
    );
  }
}
