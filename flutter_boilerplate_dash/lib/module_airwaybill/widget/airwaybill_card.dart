import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/enums/airwaybill_status.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class AirwaybillCard extends StatefulWidget {
  final AirwaybillModel model;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;
  // late bool isEdtiable;
  AirwaybillCard(
      {required this.model, required this.onDelete , required this.onEdit,required this.onDetails});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<AirwaybillCard> {




 @override
  void initState() {
   super.initState();
   // widget.isEdtiable = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       bool isFull = widget.model.status == AirwaybillStatusName[AirwaybillStatus.NOTFULL] ? false : true;
        widget.onDetails(widget.model.id , isFull);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#'+widget.model.id.toString(),
                        style: AppTextStyle.largeBlackBold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            S.of(context).airwaybillNumber+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                           Expanded(child: Text(
                            widget.model.airwaybillNumber ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                           )],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            S.of(context).subcontract+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                        Expanded(child:Text(
                            widget.model.subcontractName ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            S.of(context).status+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                           Expanded(
                            child: Text(
                            widget.model.status ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                           )],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Text(
                            S.of(context).type+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.type ?? '',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                          )],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Text(
                            S.of(context).consignee+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.consigneeName ?? '',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                          )],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Text(
                            S.of(context).shipper+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.shipperName ?? '',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                          )],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Text(
                            S.of(context).requestedFor+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.clientUserName ?? '',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                          )],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Text(
                            S.of(context).createdBy,
                            style: AppTextStyle.mediumBlack,
                          ),
                          Text(
                            widget.model.createdByUser ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            S.of(context).createdAt,
                            style: AppTextStyle.mediumBlack,
                          ),
                          Text(
                            widget.model.createdAt.toString().split(' ').first,
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            S.of(context).updatedBy,
                            style: AppTextStyle.mediumBlack,
                          ),
                          Text(
                            widget.model.updatedByUser ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            S.of(context).updatedAt,
                            style: AppTextStyle.mediumBlack,
                          ),
                          Text(
                            widget.model.updatedAt.toString().split(' ').first,
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                    widget.model.used ? Container() : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          widget.onDelete(widget.model.id);
                        },
                        child: Text(
                          S.of(context).delete,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          widget.onEdit(widget.model);
                        },
                        child: Text(
                          S.of(context).edit,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
