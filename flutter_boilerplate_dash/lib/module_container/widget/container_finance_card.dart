import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ContainerFinanceCard extends StatelessWidget {
  final ContainerFinanceModel model;
  const ContainerFinanceCard({required this.model}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title:ListTile(title: Text(model.status.toString() ,style: AppTextStyle.largeBlackBold, ),subtitle:Padding(
          padding: const EdgeInsetsDirectional.only(top: 10),
          child:model.stageCost ==0?Column(children: [
            Row(
              children: [
                Text(
                  S.of(context).buyingCost+': ',
                  style: AppTextStyle.mediumBlack,
                ),
                Text(
                  model.buyingCost.toString(),
                  style: AppTextStyle.mediumBlueBold,
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text(
                  S.of(context).sellingCost+': ',
                  style: AppTextStyle.mediumBlack,
                ),
                Text(
                  model.sellingCost.toString(),
                  style: AppTextStyle.mediumBlueBold,
                ),
              ],
            ),
          ],) :

          Text(model.stageCost.toString(),style: AppTextStyle.largeBlue, ),
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
                     S.of(context).proxy,
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.proxyName ?? '',
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
