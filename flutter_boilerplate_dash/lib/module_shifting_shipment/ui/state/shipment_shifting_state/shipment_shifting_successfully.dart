import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';
import 'package:pasco_shipping/module_shifting_shipment/widget/shipment_shift_card.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ShiftingShipmentSuccessfully extends StatelessWidget {
  final List<ShipmentShiftingModel> items;
  final Function onChangeStatus;

   ShiftingShipmentSuccessfully({
    required this.items,
    required this.onChangeStatus,
    // required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ShipmentShiftCard(
          model: items[index],
          onChangeStatus: (model,status) {
            onChangeStatus(model,status);
          },
        );
      },
      itemCount: items.length,
      shrinkWrap: true,
    );
  }
}
