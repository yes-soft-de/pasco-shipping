import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/received_deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/shipment_status_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AcceptedShipmentStatusSuccessfully extends StatefulWidget {
  final List<AcceptedShipmentStatusModel> statusModel;
  final Function onChangeStatus;
  const AcceptedShipmentStatusSuccessfully(
      {required this.statusModel, required this.onChangeStatus});

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
    if (!widget.statusModel[2].isPassed ||
        widget.statusModel[9].isPassed) {
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
                          'Write a Details about next status',
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
                          hintText: 'details',
                        ),
                        controller: editingController,
                      ),
                    ),
                  ),
                  RoundedButton(
                      lable: 'Next',
                      icon: '',
                      color: blue,
                      style: AppTextStyle.mediumWhite,
                      go: () {
                        ReceivedOrDeliveredRequest request = ReceivedOrDeliveredRequest(
                            shipmentStatus: AcceptedShipmentStatusName[
                            AcceptedShipmentStatus.RECEIVED]!,
                            isInOneHolder: false,
                            packed: false,
                            shipmentId: shipmentID,
                            statusDetails: editingController.text,
                            trackNumber: trackNumber);
                        widget.onChangeStatus(request, cityName);
                      },
                      radius: 10),
                ],
              ),
            ),
          ),

        ],
      );
    } else {
      return Container();
    }
  }
}
