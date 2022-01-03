import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/receiver_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/shipment_status_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AcceptedShipmentStatusSuccessfully extends StatefulWidget {
  final List<AcceptedShipmentStatusModel> statusModel;
  final Function onReceived;
  final Function onDelivered;
  const AcceptedShipmentStatusSuccessfully(
      {required this.statusModel, required this.onDelivered ,required this.onReceived});

  @override
  _AcceptedShipmentDetailsSuccessfullyState createState() =>
      _AcceptedShipmentDetailsSuccessfullyState();
}

class _AcceptedShipmentDetailsSuccessfullyState
    extends State<AcceptedShipmentStatusSuccessfully> {
  // late List<Category> stats;
  late int shipmentID;
  late String trackNumber;
  late String cityName;
  TextEditingController editingController = TextEditingController();
  TextEditingController receivedQuantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentID = arguments['id'];
    trackNumber = arguments['trackNumber'].toString();
    cityName = arguments['cityName'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(S.of(context).shipmentID+': '),
                      Text(shipmentID.toString(),  style: AppTextStyle.smallBlueBold,),
                    ],),
                  SizedBox(width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(S.of(context).trackNumber),
                      Text(trackNumber.toString(),  style: AppTextStyle.smallBlueBold,),
                    ],),
                ],
              ),
            ),
          ),
          widget.statusModel[1].statusDetails!.isNotEmpty ?Padding(
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
                    Expanded(child: Text(widget.statusModel[1].statusDetails ??'' , style:  AppTextStyle.mediumRedBold)),
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
          changeStatusCard()
        ],
      ),
    );
  }

  Widget changeStatusCard() {
    if (!widget.statusModel[2].isPassed) {
      return Column(
        children: [
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
                          'Received Quantity',
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
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: S.of(context).quantity,
                        ),
                        controller: receivedQuantityController,
                      ),
                    ),
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
                  RoundedButton(
                      lable: S.of(context).next,
                      icon: '',
                      color: blue,
                      style: AppTextStyle.mediumWhite,
                      go: () {
                        ReceivedRequest request = ReceivedRequest(
                            receivedQuantity: int.parse(receivedQuantityController.text),
                            supplierID: 0,
                            shipmentId: shipmentID,
                            notes: editingController.text,
                            trackNumber: trackNumber);
                        widget.onReceived(request, cityName);
                      },
                      radius: 10),
                ],
              ),
            ),
          ),

        ],
      );
    } else if(!widget.statusModel[10].isPassed && widget.statusModel[9].isPassed) {
      return Column(
        children: [
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
                  RoundedButton(
                      lable: S.of(context).next,
                      icon: '',
                      color: blue,
                      style: AppTextStyle.mediumWhite,
                      go: () {
                        DeliveredRequest request = DeliveredRequest(
                            shipmentStatus: AcceptedShipmentStatusName[
                            AcceptedShipmentStatus.DELIVERED]!,
                            isInOneHolder: false,
                            packed: false,
                            shipmentId: shipmentID,
                            statusDetails: editingController.text,
                            trackNumber: trackNumber);
                        widget.onDelivered(request);
                      },
                      radius: 10),
                ],
              ),
            ),
          ),

        ],
      );
    }
    else {
      return Container();
    }
  }
}
