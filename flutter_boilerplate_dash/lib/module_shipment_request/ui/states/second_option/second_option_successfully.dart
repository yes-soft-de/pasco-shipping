import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class SecondOptionSuccessfully extends StatefulWidget {
  final List<ClientModel> marks;
  final ShipmentRequest shipmentRequest;
  final Function goBackStep;
  final Function goNextPage;
  final Function goToAddClient;
  SecondOptionSuccessfully({required this.marks,required this.shipmentRequest,required this.goBackStep,required this.goNextPage,required this.goToAddClient});

  @override
  _SecondOptionSuccessfullyState createState() => _SecondOptionSuccessfullyState();
}

class _SecondOptionSuccessfullyState extends State<SecondOptionSuccessfully> {
  DropListModel dropListModelUnit = DropListModel(dataUnit);

  late DropListModel dropListModelMark;
  late DropListModel dropListModelFromMark;
  late List<Entry> marksEntry;
  late List<Entry> marksBackEntry;

  late Entry optionItemSelectedU;
  late Entry optionItemSelectedMar;

  late String supplierName;
  late String receiverName;
  late String receiverPhone;

  late bool isFromMarks;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('here');
    if(widget.shipmentRequest.userID !=0){
      for(ClientModel item in widget.marks){
        if(item.id == widget.shipmentRequest.userID) {
          optionItemSelectedMar = Entry(item.userName!, item.id!, []);
        }
      }
    }else {
      optionItemSelectedMar =  Entry('choose', 1, []);
    }
    // optionItemSelectedMar =  Entry('choose', 1, []);
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
    isFromMarks = false;
    marksEntry = <Entry>[];
    marksBackEntry = <Entry>[];
    for(ClientModel item in widget.marks){
      Entry v = Entry(item.userName! ,item.id! ,[]);
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
          style: AppTextStyle.mediumBlackBold,
        ),
        TextEdit(supplierName, 50, (supplierName) {
          widget.shipmentRequest.supplierName = supplierName;
        }),
        SizedBox(
          height: 25,
        ),
        Text(
          'Receiver Info : ',
          style: AppTextStyle.mediumBlackBold,
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
          style: AppTextStyle.mediumBlackBold,
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
          'Client: ',
          style: AppTextStyle.mediumBlackBold,
        ),
        Row(
          children: [
            Expanded(
              child: SelectDropList(
                this.optionItemSelectedMar,
                this.dropListModelMark,
                (optionItem) {
                  optionItemSelectedMar = optionItem;
                  widget.shipmentRequest.userID = optionItem.id;
                  widget.shipmentRequest.userName = optionItem.title;
                  print(optionItem.title);
                  setState(() {});
                },
              ),
            ),
            InkWell(
                onTap: (){
                  widget.goToAddClient(widget.shipmentRequest);
                },
                child: Icon(Icons.add_circle , color: blue , size: 40,)),
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
