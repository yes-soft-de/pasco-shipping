import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/measured_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/received_deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/stored_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/warehouse_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/shipment_status_card.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AcceptedShipmentStatusMeasured extends StatefulWidget {
  final List<AcceptedShipmentStatusModel> statusModel;
  final List<ContainerModel> containers;
  final List<TravelModel> travels;

  final Function onChangeStatus;
  const AcceptedShipmentStatusMeasured(
      {required this.statusModel,
      required this.onChangeStatus,
      required this.containers,
       required this.travels
      });

  @override
  _AcceptedShipmentDetailsSuccessfullyState createState() =>
      _AcceptedShipmentDetailsSuccessfullyState();
}

class _AcceptedShipmentDetailsSuccessfullyState
    extends State<AcceptedShipmentStatusMeasured> {
  // late List<Category> stats;
  late int shipmentID;
  late String trackNumber;

  TextEditingController editingController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  late DropListModel dropListModelContainer;
  late Entry optionItemSelectedContainer;
  late List<Entry> entryContainer;

  late DropListModel dropListModelTravel;
  late Entry optionItemSelectedTravel;
  late List<Entry> entryTravel;


  late int holderID;
  late int travelID;

  late String travelNumber;
  late String holderNumber;

  late bool separateShipment;
  late bool isDifferentTravel;

  @override
  void initState() {
    super.initState();
    entryContainer = <Entry>[];
    optionItemSelectedContainer = Entry('choose', 1, []);


    entryTravel = <Entry>[];
    optionItemSelectedTravel = Entry('choose', 1, []);

    holderID = 0;
    travelID = 0;
    travelNumber = '';
    holderNumber='';
    separateShipment = false;
    isDifferentTravel = false;

    iniList();
  }

  void iniList() {
    for (ContainerModel item in widget.containers) {
      Entry v = Entry(item.containerNumber!, item.id!, []);
      entryContainer.add(v);
    }
    dropListModelContainer = DropListModel(entryContainer);


    for (TravelModel item in widget.travels) {
      Entry v = Entry(item.travelNumber!, item.id!, []);
      entryTravel.add(v);
    }
    dropListModelTravel = DropListModel(entryTravel);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentID = arguments['id'];
    trackNumber = arguments['trackNumber'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.statusModel[3].statusDetails!.isNotEmpty ?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.warning ,color: Colors.red),
                    SizedBox(width: 10,),
                    Expanded(child: Text(widget.statusModel[3].statusDetails ??'' , style:  AppTextStyle.mediumRedBold)),
                  ],
                ),
              ),
            ),
          ) :Container(),
          ListView.builder(
            itemBuilder: (context, index) {
              return AcceptedShipmentStatusCard(widget.statusModel[index]);
            },
            itemCount: widget.statusModel.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppThemeDataService.AccentColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).writeDetails,
                          style: AppTextStyle.mediumBlackBold,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: S.of(context).details,
                        ),
                        controller: editingController,
                      ),
                    ),
                  ),
                  changeStatusCard()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget changeStatusCard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: AppThemeDataService.AccentColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                S.of(context).chooseContainer,
                style: AppTextStyle.mediumBlackBold,
              )
            ],
          ),
        ),
        SelectDropList(
          this.optionItemSelectedContainer,
          this.dropListModelContainer,
          (optionItem) {
            FocusScope.of(context).unfocus();
            optionItemSelectedContainer = optionItem;
            holderID = optionItem.id;
            holderNumber = optionItem.title;
            setState(() {});
          },
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: AppThemeDataService.AccentColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                S.of(context).chooseTravel,
                style: AppTextStyle.mediumBlackBold,
              )
            ],
          ),
        ),
        SelectDropList(
          this.optionItemSelectedTravel,
          this.dropListModelTravel,
              (optionItem) {
            FocusScope.of(context).unfocus();
            optionItemSelectedTravel = optionItem;
            travelID = optionItem.id;
            travelNumber = optionItem.title;
            setState(() {});
          },
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: AppThemeDataService.AccentColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(S.of(context).shipmentSeparation ,style: AppTextStyle.mediumBlackBold,),
              Checkbox(onChanged: (bool? value) {
                setState(() {
                  separateShipment = value!;
                });
              }, value: separateShipment,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: S.of(context).amount,
              ),
              controller: amountController,
            ),
          ),
        ) ,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(S.of(context).emptyAmount , style: AppTextStyle.mediumBlueBold,),
        ),
        RoundedButton(
            lable: S.of(context).save,
            icon: '',
            color: blue,
            style: AppTextStyle.mediumWhite,
            go: () {
              StoredRequest request = StoredRequest(
                  trackNumber: trackNumber,
                  statusDetails: editingController.text,
                  shipmentId: shipmentID,
                  packed:separateShipment ? false :true,
                  isInOneHolder:separateShipment ? false :true,
                  shipmentStatus: AcceptedShipmentStatusName[
                  AcceptedShipmentStatus.STORED]!,
                  holderID: holderID,
                  holderType: 'container',
                  holderNumber: holderNumber,
                  travelNumber: travelNumber,
                  amount:amountController.text.isEmpty?0: int.parse(amountController.text), travelID: travelID);
              widget.onChangeStatus(request , separateShipment, widget.containers,widget.travels);
            },
            radius: 10),

        // RoundedButton(
        //     lable: 'Next',
        //     icon: '',
        //     color: blue,
        //     style: AppTextStyle.mediumWhite,
        //     go: () {
        //       StoredRequest request = StoredRequest(
        //           trackNumber: trackNumber,
        //           statusDetails: editingController.text,
        //           shipmentId: shipmentID,
        //           packed: true,
        //           isInOneHolder: true,
        //           shipmentStatus: AcceptedShipmentStatusName[
        //               AcceptedShipmentStatus.STORED]!,
        //           holderID: holderID,
        //           holderType: 'container',
        //           amount: int.parse(amountController.text));
        //       widget.onChangeStatus(request);
        //     },
        //     radius: 10),
      ],
    );
  }
}
