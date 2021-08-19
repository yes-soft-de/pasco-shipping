import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_finance_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class AirwaybillFinanceCard extends StatelessWidget {
  final AirwaybillFinanceModel model;
  const AirwaybillFinanceCard({required this.model}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'stage Cost: ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.stageCost.toString(),
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
                      'Status: ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.status ?? '',
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
                      'Description: ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.stageDescription ?? '',
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
        ),
      ),
    );
  }
}
