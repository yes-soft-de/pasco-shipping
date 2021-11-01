import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/NumberInputWithIncrementDecrement.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/holder_request_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class SecondOptionSuccessfully extends StatefulWidget {
  final List<Mark> marks;
  final List<UnitModel> units;

  final List<RequestedHolders> specifications;
  final List<HarborModel> harbors;
  final List<SubcontractModel> carriers;

  final ShipmentTempRequest shipmentRequest;
  final Function goBackStep;
  final Function goNextPage;
  final Function goMarkPage;
  SecondOptionSuccessfully({required this.marks,required this.shipmentRequest,required this.goBackStep,required this.goNextPage,required this.goMarkPage,required this.units,required this.specifications,required this.harbors,required this.carriers});

  @override
  _SecondOptionSuccessfullyState createState() => _SecondOptionSuccessfullyState();
}

class _SecondOptionSuccessfullyState extends State<SecondOptionSuccessfully> {
 late DropListModel dropListModelUnit;

 late Entry optionItemSelectedType = Entry('choose', 0, []);
 DropListModel dropListModelHolderTypeLocal = DropListModel(holderTypeLocal);
 DropListModel dropListModelHolderTypeEx = DropListModel(holderTypeEx);
  late DropListModel dropListModelMark;
  late DropListModel dropListModelFromMark;
  late List<Entry> marksEntry;
  late List<Entry> unitsEntry;
  late List<Entry> marksBackEntry;

  late Entry optionItemSelectedU;
  late Entry optionItemSelectedMar;
 late Entry optionItemSelectedTim = Entry('choose', 0, []);
  late String supplierName;
  // late String receiverName;
  // late String receiverPhone;
 late Entry optionItemSelectedHarbor = Entry('choose', 0, []);
 late Entry optionItemSelectedCarrier = Entry('choose', 0, []);
 late DropListModel dropListModelHarbor;
 late DropListModel dropListModelCarrier;
 late List<Entry> harborEntry;
 late List<Entry> carrierEntry;

  late bool isFromMarks;

 late String initHolderQuantity;
 late String initQuantity;
 late RequestedHolders setSelectSpec;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('here');
    if(widget.shipmentRequest.holderCount == 1){
      initHolderQuantity = '1';
    }else {
      initHolderQuantity = widget.shipmentRequest.holderCount.toString();
    }
    if(widget.shipmentRequest.holders.isNotEmpty){
      optionItemSelectedHarbor = Entry(widget.shipmentRequest.holders[0].portName??'', widget.shipmentRequest.holders[0].portID??0, []);;
    }
    if(widget.shipmentRequest.markId !=0){
      for(Mark item in widget.marks){
        if(item.id == widget.shipmentRequest.markId) {
          optionItemSelectedMar = Entry(item.markNumber!, item.id!, []);
        }
      }
    }else {
      optionItemSelectedMar =  Entry('choose', 0, []);
    }

    if(widget.shipmentRequest.supplierName.isNotEmpty){
      supplierName = widget.shipmentRequest.supplierName;
    }else{
      supplierName=S.of(context).nameHere;
    }

    // if(widget.shipmentRequest.receiverName.isNotEmpty){
    //   receiverName = widget.shipmentRequest.receiverName;
    // }else{
    //   receiverName=S.of(context).nameHere;
    // }
    //
    // if(widget.shipmentRequest.receiverPhoneNumber.isNotEmpty){
    //   receiverPhone = widget.shipmentRequest.receiverPhoneNumber;
    // }else{
    //   receiverPhone=S.of(context).phone;
    // }
    if(widget.shipmentRequest.paymentTime.isNotEmpty){
      optionItemSelectedTim = Entry(widget.shipmentRequest.paymentTime, 0, []);
    }else {
      optionItemSelectedTim = Entry('choose', 0, []);
    }

    if(widget.shipmentRequest.unit.isNotEmpty){
      optionItemSelectedU = Entry(widget.shipmentRequest.unit, 1, []);
    }else{
      optionItemSelectedU=Entry('choose', 1, []);
    }
    if(widget.shipmentRequest.holderType.isNotEmpty){
      optionItemSelectedType = Entry(widget.shipmentRequest.holderType, 1, []);
    }else if(widget.shipmentRequest.isExternalWarehouse) {
      optionItemSelectedType = Entry('FCL', 0, []);
      widget.shipmentRequest.holderType = 'FCL';
    }else{
      optionItemSelectedType = Entry('choose', 0, []);
    }
    if(widget.shipmentRequest.quantity == 0){
      initQuantity = '0';
    }else {
      initQuantity = widget.shipmentRequest.quantity.toString();
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
    harborEntry = <Entry>[];
    carrierEntry = <Entry>[];
    marksBackEntry = <Entry>[];
    for(Mark item in widget.marks){
      Entry v = Entry(item.markNumber! ,item.id! ,[]);
      marksEntry.add(v);
    }
    dropListModelMark = DropListModel(marksEntry);

    for(UnitModel item in widget.units){
      Entry v = Entry(item.name! ,item.id! ,[]);
      unitsEntry.add(v);
    }
    dropListModelUnit = DropListModel(unitsEntry);
    initLists();
  }
 void initLists(){
   for(HarborModel item in widget.harbors){
     Entry v = Entry(item.name! ,item.id! ,[]);
     harborEntry.add(v);
   }
   dropListModelHarbor = DropListModel(harborEntry);


   for(SubcontractModel item in widget.carriers){
     Entry v = Entry(item.fullName! ,item.id! ,[]);
     carrierEntry.add(v);
   }
   dropListModelCarrier = DropListModel(carrierEntry);

 }
  @override
  Widget build(BuildContext context) {
    print(dropListModelMark.listOptionItems.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).supplierInfo,
          style: white18text,
        ),
        TextEdit(title: widget.shipmentRequest.supplierName, hint:S.of(context).name,onChange:(supplierName) {
          widget.shipmentRequest.supplierName = supplierName;
        }),
        SizedBox(
          height: 25,
        ),

        (widget.shipmentRequest.isExternalWarehouse)?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Text(
              S.of(context).harbors,
              style: white18text,
            ),
            SelectDropList(
              this.optionItemSelectedHarbor,
              this.dropListModelHarbor,
                  (optionItem) {
                optionItemSelectedHarbor = optionItem;
                setState(() {});
              },
            ),
          ],):Container(),
        SizedBox(
          height: 15,
        ),
        Text(
          S.of(context).shippingType,
          style:white18text,
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
                  if(optionItemSelectedHarbor.id==0){
                    Fluttertoast.showToast(msg: 'Select the harbor first');
                  }else{
                    showSingleChoiceDialog(context , (se){
                      widget.shipmentRequest.holders.add(se);
                      Navigator.pop(context);
                      setState(() {});
                    });
                  }
                },
                child: Icon(Icons.add_circle , color: white , size: 40,)) :Container(),
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
        Text(
          S.of(context).unit,
          style: white18text,
        ),
        SelectDropList(
          this.optionItemSelectedU,
          this.dropListModelUnit,
          (optionItem) {
            FocusScope.of(context).unfocus();
            optionItemSelectedU = optionItem;
            widget.shipmentRequest.unit = optionItem.title;
            setState(() {});
          },
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              S.of(context).quantity,
              style: white18text,
            ),
            NumberInputWithIncrementDecrement(initQuantity , (quantity){
              print(initQuantity);
              widget.shipmentRequest.quantity = int.parse(quantity);
            }),
          ],
        ),

        SizedBox(
          height: 15,
        ),
        Text(
          S.of(context).mark,
          style: white18text,
        ),
        Row(
          children: [
            Expanded(
              child: SelectDropList(
                this.optionItemSelectedMar,
               isFromMarks ? this.dropListModelFromMark : this.dropListModelMark,
                (optionItem) {
                  FocusScope.of(context).unfocus();
                  optionItemSelectedMar = optionItem;
                  widget.shipmentRequest.markId = optionItem.id;
                  widget.shipmentRequest.markName = optionItem.title;
                  print(optionItem.title);
                  setState(() {});
                },
              ),
            ),
            InkWell(
              onTap: () {
                widget.goMarkPage();
                // Navigator.pushNamed(context, MarkRoutes.mark).then((value) {
                //   print('back');
                //  setState(() {
                //    List<Mark>  marks = value as List<Mark>;
                //    isFromMarks = true;
                //    marksEntry = <Entry>[];
                //    for(Mark item in marks){
                //      Entry v = Entry(item.markNumber! ,item.id! ,[]);
                //      marksEntry.add(v);
                //    }
                //    this.dropListModelFromMark = DropListModel(marksEntry);
                //  });
                // });
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
                    widget.goNextPage();
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

 void showSingleChoiceDialog(BuildContext context, Function go) {
   showDialog(
       context: context,
       builder: (context) {
         setSelectSpec = RequestedHolders(name: '',notes: '',carrierID: 0,portID: 0,specificationID: 0,portName: '',carrierName: '');
         return StatefulBuilder(
             builder: (context, setState) {
               return AlertDialog(
                 backgroundColor:Colors.grey,
                   title: Text("Select one and then add note"),
                   content: SingleChildScrollView(
                     child: Container(
                       width: double.maxFinite,
                       // color: AppThemeDataService.AccentColor,
                       // height: double.maxFinite,
                       child: Column(
                         children: [
                           Column(
                             mainAxisSize: MainAxisSize.min,
                             children: widget.specifications
                                 .map((e) =>
                                 RadioListTile(
                                   title: Text(e.name ?? ''),
                                   value: e,
                                   groupValue: setSelectSpec,
                                   selected: e.name == setSelectSpec.name,
                                   onChanged: (value) {
                                     setState(() {
                                       setSelectSpec =
                                       value as RequestedHolders;
                                     });
                                   },
                                 ))
                                 .toList(),
                           ),
                           Text(
                             S.of(context).carrier,
                             style: black18text,
                           ),
                           SelectDropList(
                             this.optionItemSelectedCarrier,
                             this.dropListModelCarrier,
                                 (optionItem) {
                               optionItemSelectedCarrier = optionItem;
                               setState(() {});
                             },
                           ),
                           TextEdit(title: '', hint: S
                               .of(context)
                               .importantNote, onChange: (notes) {
                             setSelectSpec.notes = notes;
                           }),
                           RoundedButton(lable: S
                               .of(context)
                               .save,
                               icon: '',
                               color: AppThemeDataService.AccentColor,
                               style: white16text,
                               go: () {
                                 setSelectSpec.portID =
                                     optionItemSelectedHarbor.id;
                                 setSelectSpec.carrierID =
                                     optionItemSelectedCarrier.id;
                                 setSelectSpec.carrierName =
                                 optionItemSelectedCarrier.title == 'choose'
                                     ? ''
                                     : optionItemSelectedCarrier.title;
                                 setSelectSpec.portName =
                                     optionItemSelectedHarbor.title;
                                 go(setSelectSpec);
                               },
                               radius: 12)
                         ],
                       ),
                     ),
                   ));
             });
       });
 }

}
