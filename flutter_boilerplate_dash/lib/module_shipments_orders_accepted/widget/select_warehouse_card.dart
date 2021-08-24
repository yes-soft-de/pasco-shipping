import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class SelectWarehouseCard extends StatelessWidget {
  final WarehousesModel model;
  final Function goToAcceptedShipment;
  const SelectWarehouseCard({required this.model,required this.goToAcceptedShipment}) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToAcceptedShipment(model.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                 S.of(context).name,
                  style: AppTextStyle.mediumBlack,
                ),
                Text(
                  model.name ?? '',
                  style: AppTextStyle.mediumBlueBold,
                )],
            ),
          ),
        ),
      ),
    );
  }
}
