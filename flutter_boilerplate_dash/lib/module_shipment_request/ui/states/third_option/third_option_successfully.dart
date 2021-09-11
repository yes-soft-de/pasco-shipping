import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ThirdOptionsSuccessfully extends StatefulWidget {
  final List<DistributorModel> distributors;
  final List<Mark> marks;
  final List<ReceiverModel> receiver;
  final ShipmentRequest shipmentRequest;
  final Function goBackStep;
  final Function goToMark;
  final Function goToReceiver;
  final Function onRequest;
  const ThirdOptionsSuccessfully({required this.shipmentRequest,required this.goBackStep,required this.distributors, required this.marks,required this.onRequest,required this.goToMark,required this.receiver,required this.goToReceiver});

  @override
  _ThirdOptionsState createState() => _ThirdOptionsState();
}

class _ThirdOptionsState extends State<ThirdOptionsSuccessfully> {


  late DropListModel dropListModelDist;

  late DropListModel dropListModelMarks;
  late DropListModel dropListModelReceiver;


  late String vehicle;
  late String extra;


  late Entry optionItemSelectedDist;
  late Entry optionItemSelectedMarks;
  late Entry optionItemSelectedReceiver;

  late List<Entry> marksEntry;
  late List<Entry> distrbutorEntry;
  late List<Entry> receiverEntry;
  @override
  void initState() {
    super.initState();
    marksEntry= <Entry>[];
    distrbutorEntry = <Entry>[];
    receiverEntry = <Entry>[];

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
    if (widget.shipmentRequest.markId !=0) {
      optionItemSelectedMarks = Entry(widget.shipmentRequest.markName, widget.shipmentRequest.markId, []);
    } else {
      optionItemSelectedMarks = Entry('choose', 0, []);
    }

    if (widget.shipmentRequest.receiverID !=0) {
      optionItemSelectedReceiver = Entry(widget.shipmentRequest.receiverName, widget.shipmentRequest.receiverID, []);
    } else {
      optionItemSelectedReceiver = Entry('choose', 0, []);
    }

    if (widget.shipmentRequest.distributorID !=0) {
      optionItemSelectedDist = Entry(widget.shipmentRequest.distributorName, widget.shipmentRequest.distributorID, []);
    } else {
      optionItemSelectedDist = Entry('choose', 0, []);
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for(Mark item in widget.marks){
      Entry v = Entry(item.markNumber! ,item.id??0 ,[]);
      marksEntry.add(v);
    }
    dropListModelMarks = DropListModel(marksEntry);

    for(DistributorModel item in widget.distributors){
      Entry v = Entry(item.fullName! ,item.id??0 ,[]);
      distrbutorEntry.add(v);
    }
    dropListModelDist = DropListModel(distrbutorEntry);

    for(ReceiverModel item in widget.receiver){
      Entry v = Entry(item.fullName! ,item.id??0 ,[Entry(item.phone! ,item.id??0,[])]);
      receiverEntry.add(v);
    }
    dropListModelReceiver = DropListModel(receiverEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).receiverInfo,
            style: AppTextStyle.mediumBlackBold,
          ),
          Row(
            children: [
              Expanded(
                child: SelectDropList(
                  this.optionItemSelectedReceiver,
                  this.dropListModelReceiver,
                      (optionItem) {
                    optionItemSelectedReceiver = optionItem;
                    widget.shipmentRequest.receiverName = optionItem.title;
                    widget.shipmentRequest.receiverID = optionItem.id;
                    widget.shipmentRequest.receiverPhoneNumber = optionItem.children[0].title;
                    setState(() {});
                  },
                ),
              ),
              InkWell(
                  onTap: (){
                    widget.goToReceiver();
                  },
                  child: Icon(Icons.add_circle , color: blue , size: 40,)),
            ],
          ),
          SizedBox(
            height: 15,
          ),


          Text(
            S.of(context).mark,
            style: AppTextStyle.mediumBlackBold,
          ),
          Row(
            children: [
              Expanded(
                child: SelectDropList(
                  this.optionItemSelectedMarks,
                  this.dropListModelMarks,
                      (optionItem) {
                    optionItemSelectedMarks = optionItem;
                    widget.shipmentRequest.markName = optionItem.title;
                    widget.shipmentRequest.markId = optionItem.id;
                    setState(() {});
                  },
                ),
              ),
              InkWell(
                  onTap: (){
                    widget.goToMark();
                  },
                  child: Icon(Icons.add_circle , color: blue , size: 40,)),
            ],
          ),
          SizedBox(
            height: 15,
          ),

          Text(
            S.of(context).distributor,
            style: AppTextStyle.mediumBlackBold,
          ),
          SelectDropList(
            this.optionItemSelectedDist,
            this.dropListModelDist,
                (optionItem) {
              optionItemSelectedDist = optionItem;
              widget.shipmentRequest.distributorName = optionItem.title;
              widget.shipmentRequest.distributorID = optionItem.id;
              setState(() {});
            },
          ),
          SizedBox(
            height: 15,
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
                  style: AppTextStyle.mediumBlackBold,
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
            style: AppTextStyle.mediumBlackBold,
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
                widget.onRequest(widget.shipmentRequest);
              },
              style: AppTextStyle.mediumWhite,
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
        // await setShipment(widget._shipmentRequest);
        // Navigator.pop(context);
        // await Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.Home, (route) => false);
      },
      text: 'Your request added successfully!',
    );
  }
}