import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';
import 'package:pasco_shipping/module_shipment_invoices/widget/invoice_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';

class InvoiceShipmentSuccessfully extends StatelessWidget {
  final List<InvoiceModel> items;
  final Function payBill;
  final Function addAttached;
  final Function onSearch;
  // final Function onDetails;


  const InvoiceShipmentSuccessfully({
    required this.items,required this.payBill,required this.addAttached,required this.onSearch
    // required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchCard(onSearch: (shipmentID) {
          onSearch(shipmentID);
        },title: 'Enter the shipment ID',),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InvoiceCard(
                model: items[index], payBill: (model){
                payBill(model);
              }, addAttached: (model){
                  addAttached(model);
              },
              );
            },
            itemCount: items.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
