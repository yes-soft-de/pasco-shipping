import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/notifiyer.dart';
import 'package:pasco_shipping/module_shipment_request/response/specefication/specefication.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/NumberInputWithIncrementDecrement.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/holder_request_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class SecondOptionSuccessfully extends StatefulWidget {
  final List<ClientModel> marks;
  final List<UnitModel> units;
  final List<RequestedHolders> specifications;
  final ShipmentRequest shipmentRequest;
  final Function goBackStep;
  final Function goNextPage;
  final Function goToAddClient;
  SecondOptionSuccessfully({required this.marks,required this.shipmentRequest,required this.goBackStep,required this.goNextPage,required this.goToAddClient,required this.units,required this.specifications});

  @override
  _SecondOptionSuccessfullyState createState() => _SecondOptionSuccessfullyState();
}

class _SecondOptionSuccessfullyState extends State<SecondOptionSuccessfully> {

  DropListModel dropListModelTime = DropListModel(dataTime);
  DropListModel dropListModelHolderTypeLocal = DropListModel(holderTypeLocal);
  DropListModel dropListModelHolderTypeEx = DropListModel(holderTypeEx);
  late Entry optionItemSelectedTim = Entry('choose', 0, []);
  late Entry optionItemSelectedType = Entry('choose', 0, []);

  late DropListModel dropListModelMark;
 late DropListModel dropListModelUnit;
  late DropListModel dropListModelFromMark;
  late List<Entry> marksEntry;
  late List<Entry> unitsEntry;
  late List<Entry> marksBackEntry;

  late Entry optionItemSelectedU;
  late Entry optionItemSelectedMar;

  late String supplierName;
  late String receiverName;
  late String receiverPhone;
  late String initQuantity;

  // late List<RequestedHolders> holders;

  late RequestedHolders setSelectSpec;

  late bool isFromMarks;
  late SpecificationsModel currentValue;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if(widget.shipmentRequest.holderCount == 1){
      initQuantity = '1';
    }else {
      initQuantity = widget.shipmentRequest.holderCount.toString();
    }

    if(widget.shipmentRequest.userID !=0){
      for(ClientModel item in widget.marks){
        if(item.id == widget.shipmentRequest.userID) {
          optionItemSelectedMar = Entry(item.userName!, item.id!, []);
        }
      }
    }else {
      optionItemSelectedMar =  Entry('choose', 0, []);
    }
    // optionItemSelectedMar =  Entry('choose', 0, []);
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
      optionItemSelectedU=Entry('choose', 0, []);
    }
    if(widget.shipmentRequest.paymentTime.isNotEmpty){
      optionItemSelectedTim = Entry(widget.shipmentRequest.paymentTime, 1, []);
    }else {
      optionItemSelectedTim = Entry('choose', 0, []);
    }

    if(widget.shipmentRequest.holderType.isNotEmpty){
      optionItemSelectedType = Entry(widget.shipmentRequest.holderType, 1, []);
    }else if(widget.shipmentRequest.isExternalWarehouse) {
      optionItemSelectedType = Entry('FCL', 0, []);
      widget.shipmentRequest.holderType = 'FCL';
    }else{
      optionItemSelectedType = Entry('choose', 0, []);
    }

    if(widget.specifications.isNotEmpty){
      setSelectSpec = widget.specifications[0];
    }
  }

  @override
  void initState() {
    super.initState();
    isFromMarks = false;
    marksEntry = <Entry>[];
    unitsEntry = <Entry>[];
    marksBackEntry = <Entry>[];
    for(ClientModel item in widget.marks){
      Entry v = Entry(item.userName! ,item.id! ,[]);
      marksEntry.add(v);
    }
    dropListModelMark = DropListModel(marksEntry);


    for(UnitModel item in widget.units){
      Entry v = Entry(item.name! ,item.id! ,[]);
      unitsEntry.add(v);
    }
    dropListModelUnit = DropListModel(unitsEntry);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).supplierInfo,
          style: AppTextStyle.mediumBlackBold,
        ),
        TextEdit(title: widget.shipmentRequest.supplierName, hint:S.of(context).name,onChange:(supplierName) {
          widget.shipmentRequest.supplierName = supplierName;
        }),
        SizedBox(
          height: 25,
        ),
        Text(
          S.of(context).paymentTime,
          style: AppTextStyle.mediumBlackBold,
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
          style: AppTextStyle.mediumBlackBold,
        ),
        Row(
          children: [
            Expanded(
              child: SelectDropList(
                this.optionItemSelectedType,
               widget.shipmentRequest.isExternalWarehouse?
               this.dropListModelHolderTypeEx :this.dropListModelHolderTypeLocal,
                    (optionItem) {
                  optionItemSelectedType = optionItem;
                  widget.shipmentRequest.holderType = optionItem.title;
                  setState(() {});
                },
              ),
            ),
            ( optionItemSelectedType.title=='FCL' && widget.shipmentRequest.isExternalWarehouse)?
            InkWell(
                onTap: (){
                  showSingleChoiceDialog(context , (){
                    Navigator.pop(context);
                    setState(() {});
                  });
                },
                child: Icon(Icons.add_circle , color: blue , size: 40,)) :Container(),
          ],
        ),
        ListView.builder(itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: (){
                widget.shipmentRequest.holders.removeAt(index);
                setState(() {});
              },
              child: Badge(
                  badgeContent: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 15,
                  ),
                  child: RequestHolderCard(requestHolder: widget.shipmentRequest.holders[index],)),
            ),
          );
        },itemCount: widget.shipmentRequest.holders.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
        SizedBox(
          height: 15,
        ),
        // ( optionItemSelectedType.title=='FCL' && widget.shipmentRequest.isExternalWarehouse)?
    // Text(
    // S.of(context).type,
    // style: AppTextStyle.mediumBlackBold,
    // ):Container(),

        Text(
          S.of(context).unit,
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
          S.of(context).client,
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
                          label: Text(S.of(context).back),
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
                    if(
                   widget.shipmentRequest.paymentTime.isEmpty
                    || widget.shipmentRequest.holderType.isEmpty
                    || widget.shipmentRequest.unit.isEmpty
                    || widget.shipmentRequest.userName.isEmpty
                    ||(widget.shipmentRequest.isExternalWarehouse && widget.shipmentRequest.holders.isEmpty)
                    ){
                      Fluttertoast.showToast(msg: S.of(context).fillAllField);
                    }
                    else {widget.goNextPage();}
                  },
                  icon: Icon(
                    Icons.arrow_forward_outlined,
                  ),
                  label: Text(S.of(context).next),
                )),
          ],
        )

      ],
    );
  }

 void showSingleChoiceDialog(BuildContext context, Function go) =>
     showDialog(
      context: context,
      builder: (context) {
        // var _singleNotifier = Provider.of<SingleNotifier>(context);
        return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                  title: Text("Select one and then add note"),
                  content: SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      // height: double.maxFinite,
                      child: Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.specifications
                                .map((e) =>
                                RadioListTile(
                                  title: Text(e.name),
                                  value: e,
                                  groupValue: setSelectSpec,
                                  selected: e.name == setSelectSpec.name,
                                  onChanged: (value) {
                                    if (value != setSelectSpec) {
                                      setState(() {
                                        setSelectSpec =
                                        value as RequestedHolders;
                                      });
                                    }
                                  },
                                ))
                                .toList(),
                          ),
                          TextEdit(title: '',hint:S.of(context).importantNote  ,onChange: (notes){
                            setSelectSpec.notes = notes;
                          }),
                          RoundedButton(lable: S.of(context).save, icon: '',
                              color: blue, style: AppTextStyle.mediumWhite,
                              go: (){
                                widget.shipmentRequest.holders.add(setSelectSpec);
                                go();
                              }, radius: 12)
                        ],
                      ),
                    ),
                  ));
            });
      });

}
