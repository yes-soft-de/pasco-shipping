import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/NumberInputWithIncrementDecrement.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ThirdOptionsSuccessfully extends StatefulWidget {
  final List<ReceiverModel> receiver;
  final ShipmentTempRequest shipmentRequest;
  final Function goBackStep;
  final Function goReceiver;
  const ThirdOptionsSuccessfully({required this.shipmentRequest,required this.goBackStep, required this.receiver,required this.goReceiver });

  @override
  _ThirdOptionsState createState() => _ThirdOptionsState();
}

class _ThirdOptionsState extends State<ThirdOptionsSuccessfully> {
  DropListModel dropListModelTime = DropListModel(dataTime);
  DropListModel dropListModelHolderType = DropListModel(holderType);
  late DropListModel dropListModelReceiver ;
  late String vehicle;
  late String extra;
  late Entry optionItemSelectedTim = Entry('choose', 0, []);
  late Entry optionItemSelectedType = Entry('choose', 0, []);
  late Entry optionItemSelectedReceiver = Entry('choose', 0, []);
  late List<Entry> receiverEntry;
  late String initQuantity;
  @override
  void initState() {
    super.initState();
    receiverEntry = <Entry>[];
    if(widget.shipmentRequest.holderCount == 0){
      initQuantity = '1';
    }else {
      initQuantity = widget.shipmentRequest.holderCount.toString();
    }
    if (widget.shipmentRequest.vehicleIdentificationNumber.isNotEmpty) {
      vehicle = widget.shipmentRequest.vehicleIdentificationNumber;
    } else {
      vehicle = '123...';
    }

    if (widget.shipmentRequest.extraSpecification.isNotEmpty) {
      extra = widget.shipmentRequest.extraSpecification;
    } else {
      extra = 'Text...';
    }

    if(widget.shipmentRequest.paymentTime.isNotEmpty){
      optionItemSelectedTim = Entry(widget.shipmentRequest.paymentTime, 0, []);
    }else {
      optionItemSelectedTim = Entry('choose', 0, []);
    }

    if(widget.shipmentRequest.holderType.isNotEmpty){
      optionItemSelectedType = Entry(widget.shipmentRequest.holderType, 0, []);
    }else {
      optionItemSelectedType = Entry('choose', 0, []);
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for(ReceiverModel item in widget.receiver){
      if(item.id == widget.shipmentRequest.receiverID) {
        optionItemSelectedReceiver = Entry(item.fullName!, item.id!, [Entry(item.phone! ,item.id??0,[])]);
      }
      Entry v = Entry(item.fullName!, item.id!, [Entry(item.phone! ,item.id??0,[])]);
      receiverEntry.add(v);
    }
    dropListModelReceiver =DropListModel(receiverEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           S.of(context).paymentTime,
            style: white18text,
          ),
          SelectDropList(
            this.optionItemSelectedTim,
            this.dropListModelTime,
            (optionItem) {
              optionItemSelectedTim = optionItem;
              widget.shipmentRequest.paymentTime = optionItem.title;
              setState(() {});
            },
          ),
          SizedBox(
            height: 15,
          ),
          Text(
           S.of(context).shippingType,
            style: white18text,
          ),
          SelectDropList(
            this.optionItemSelectedType,
            this.dropListModelHolderType,
                (optionItem) {
              optionItemSelectedType = optionItem;
              widget.shipmentRequest.holderType = optionItem.title;
              setState(() {});
            },
          ),

          (optionItemSelectedType.title=='FCL' && widget.shipmentRequest.isExternalWarehouse)?
          Row(
            children: [
              Text(
                S.of(context).holderCount,
                style: white18text,
              ),
              NumberInputWithIncrementDecrement(initQuantity , (quantity ){
                widget.shipmentRequest.holderCount = quantity;
              }),
            ],
          ):Container(),

          SizedBox(
            height: 15,
          ),
          Text(
            S.of(context).receivers,
            style: white18text,
          ),
          Row(
            children: [
              Expanded(
                child:  SelectDropList(
                  this.optionItemSelectedReceiver,
                  this.dropListModelReceiver,
                      (optionItem) {
                    optionItemSelectedReceiver = optionItem;
                    widget.shipmentRequest.receiverID = optionItem.id;
                    widget.shipmentRequest.receiverName = optionItem.title;
                    widget.shipmentRequest.receiverPhoneNumber = optionItem.children[0].title;
                    setState(() {});
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  widget.goReceiver();
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

          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: widget.shipmentRequest.productCategoryName=='Car' ? true :false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).vehicleNumber,
                  style: white18text,
                ),
                TextEdit(vehicle, 50, (number) {
                  widget.shipmentRequest.vehicleIdentificationNumber = number ?? "";
                }),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).extraSpecification,
            style: white18text,
          ),
          TextEdit(extra, 200, (extra) {
            widget.shipmentRequest.extraSpecification = extra;
          }),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 25, end: 25),
            child: RoundedButton(
              radius: 15,
              lable: S.of(context).requestShipment,
              icon: '',
              color: Theme.of(context).accentColor,
              go: () {
                _showDialog(context);
              },
              style: mainHeaderBlackStyle,
            ),
          ),
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
                        label: Text(S.of(context).back),
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      backgroundColor: AppThemeDataService.PrimaryColor,
      confirmBtnColor: AppThemeDataService.AccentColor,
      onConfirmBtnTap: () async{
        print("hereRahaf"+widget.shipmentRequest.toString());
        await setShipment(widget.shipmentRequest);
        Navigator.pop(context);
       await Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.Home, (route) => false);
      },
      text: 'Your request added successfully!',
    );
  }
}
