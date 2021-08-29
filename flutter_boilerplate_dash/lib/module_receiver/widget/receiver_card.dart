import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ReceiverCard extends StatelessWidget {
  final ReceiverModel model;
  // final String incrementNumber;
  // final Function deleteMark;
  final Entry optionItem;
  // final String name;
  const ReceiverCard({required this.model,required this.optionItem});

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
                      S.of(context).name,
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.fullName ??'',
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
                      S.of(context).phone+': ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.phone ?? '',
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
                      S.of(context).email+': ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.email ?? '',
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
                      S.of(context).address+': ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      model.address ?? '',
                      style: AppTextStyle.mediumBlueBold,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
