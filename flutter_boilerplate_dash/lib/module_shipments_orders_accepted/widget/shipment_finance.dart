import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ShipmentFinanceCard extends StatelessWidget {
  final ShipmentFinanceModel model;
  const ShipmentFinanceCard({required this.model}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title:ListTile(title: Text(model.status.toString() ,style: AppTextStyle.largeBlackBold, ),subtitle:Padding(
          padding: const EdgeInsetsDirectional.only(top: 10),
          child: Text(model.stageCost.toString(),style: AppTextStyle.largeBlue, ),
        ),),
        leading: Icon(Icons.monetization_on,size: 30,),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      S.of(context).description,
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.stageDescription ?? '',
                      style: AppTextStyle.mediumBlueBold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      S.of(context).subcontract+': ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.subcontractName ?? '',
                      style: AppTextStyle.mediumBlueBold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Check Number: ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.chequeNumber ?? '',
                      style: AppTextStyle.mediumBlueBold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Fund Name: ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.financialFundName ?? '',
                      style: AppTextStyle.mediumBlueBold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      S.of(context).paymentTime,
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.paymentType ?? '',
                      style: AppTextStyle.mediumBlueBold,
                    ),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Added by: ',
              //         style: AppTextStyle.mediumBlack,
              //       ),
              //       Text(
              //         model.createdByUser ?? '',
              //         style: AppTextStyle.mediumBlueBold,
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Added at: ',
              //         style: AppTextStyle.mediumBlack,
              //       ),
              //       Text(
              //         model.createdAt.toString().split('.').first,
              //         style: AppTextStyle.mediumBlueBold,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
