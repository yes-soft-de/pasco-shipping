import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
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
  final List<Mark> clients;
  final ShipmentRequest shipmentRequest;
  final Function goBackStep;
  final Function goToMark;
  final Function onRequest;
  const ThirdOptionsSuccessfully({required this.shipmentRequest,required this.goBackStep,required this.distributors, required this.clients,required this.onRequest,required this.goToMark});

  @override
  _ThirdOptionsState createState() => _ThirdOptionsState();
}

class _ThirdOptionsState extends State<ThirdOptionsSuccessfully> {
  DropListModel dropListModelTime = DropListModel(dataTime);
  DropListModel dropListModelHolderType = DropListModel(holderType);

  late DropListModel dropListModelDist;

  late DropListModel dropListModelClient;


  late String vehicle;
  late String extra;
  late Entry optionItemSelectedTim = Entry('choose', 1, []);
  late Entry optionItemSelectedType = Entry('choose', 1, []);

  late Entry optionItemSelectedDist = Entry('choose', 1, []);
  late Entry optionItemSelectedClient = Entry('choose', 1, []);

  late List<Entry> clientsEntry;
  late List<Entry> distrbutorEntry;
  @override
  void initState() {
    super.initState();
    clientsEntry= <Entry>[];
    distrbutorEntry = <Entry>[];

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
      optionItemSelectedTim = Entry(widget.shipmentRequest.paymentTime, 1, []);
    }else {
      optionItemSelectedTim = Entry('choose', 1, []);
    }

    if(widget.shipmentRequest.holderType.isNotEmpty){
      optionItemSelectedType = Entry(widget.shipmentRequest.holderType, 1, []);
    }else {
      optionItemSelectedType = Entry('choose', 1, []);
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for(Mark item in widget.clients){
      Entry v = Entry(item.markNumber! ,item.id??1 ,[]);
      clientsEntry.add(v);
    }
    dropListModelClient = DropListModel(clientsEntry);

    for(DistributorModel item in widget.distributors){
      Entry v = Entry(item.fullName! ,item.id??1 ,[]);
      distrbutorEntry.add(v);
    }
    dropListModelDist = DropListModel(distrbutorEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mark: ',
            style: AppTextStyle.mediumBlackBold,
          ),
          Row(
            children: [
              Expanded(
                child: SelectDropList(
                  this.optionItemSelectedClient,
                  this.dropListModelClient,
                      (optionItem) {
                    optionItemSelectedClient = optionItem;
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
            'Distributor name : ',
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

          Text(
            'Payment time : ',
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
            'Holder type : ',
            style: AppTextStyle.mediumBlackBold,
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
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: widget.shipmentRequest.productCategoryName=='Car' ? true :false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vehicle identification number (if vehicle)',
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
            'Extra specifications',
            style: AppTextStyle.mediumBlackBold,
          ),
          TextEdit(extra, 200, (extra) {
            widget.shipmentRequest.extraSpecification = extra;
          }),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 25, end: 25),
            child: RoundedButton(
              radius: 15,
              lable: 'Request',
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
                        label: Text('Back'),
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