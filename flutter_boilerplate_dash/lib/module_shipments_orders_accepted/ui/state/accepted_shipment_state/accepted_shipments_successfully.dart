import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/accepted_shipment_card.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AcceptedShipmentSuccessfully extends StatelessWidget {
  final Data items;
  final Function onDetails;
  final Function onSearch;
  final AcceptedShipmentFilterRequest filterRequest;
  final Function addContainer;
  final bool hideAddButton;

  const AcceptedShipmentSuccessfully(
      {required this.items,
      required this.onDetails,
      required this.onSearch,
        required this.addContainer,
      required this.filterRequest,required this.hideAddButton});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchCard(onSearch: (number) {
              onSearch(number);
            }),
          ),
          ( filterRequest.status != AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED] && !filterRequest.isExternalWarehouse! && !hideAddButton)?
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[800],
            ),
            onPressed: () {
              addContainer();
            },
            icon: Icon(Icons.add_circle),
            label: Text(
              S.of(context).requestContainer,
              style: AppTextStyle.mediumWhite,
            ),
          ) : Container(),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8.0),
            child: Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).shipmentReceived + ': ',
                        style: AppTextStyle.mediumBlackBold,
                      ),
                      Text(
                        items.statistics!.received.toString(),
                        style: AppTextStyle.mediumRedBold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).shipmentNotDelivered + ': ',
                          style: AppTextStyle.mediumBlackBold,
                        ),
                        Text(
                          items.statistics!.notDelivered.toString(),
                          style: AppTextStyle.mediumRedBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).shipmentDelivered + ': ',
                          style: AppTextStyle.mediumBlackBold,
                        ),
                        Text(
                          items.statistics!.delivered.toString(),
                          style: AppTextStyle.mediumRedBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return AcceptedShipmentCard(
                shipmentModel: items.data![index],
                onDetails: (model) {
                  onDetails(model);
                },
              );
            },
            itemCount: items.data!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
