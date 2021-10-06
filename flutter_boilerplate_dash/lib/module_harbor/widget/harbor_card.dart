import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_suppliers/request/suppliers_request.dart';
import 'package:pasco_shipping/module_suppliers/response/suppliers_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';


class HarborCard extends StatefulWidget {
  final HarborModel model;
  final Function onDelete;
  final Function onEdit;
  HarborCard(
      {required this.model, required this.onDelete , required this.onEdit});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<HarborCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('#' + widget.model.id.toString() , style: AppTextStyle.largeBlackBold,),
                    Row(
                      children: [
                        Text(
                          S.of(context).name+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          widget.model.name ?? '',
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
                          S.of(context).country+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                          widget.model.countryName ?? '',
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
                          S.of(context).city+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            widget.model.city ?? '',
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
                          S.of(context).location+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            widget.model.location ?? '',
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
                          S.of(context).type+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
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
              SizedBox(width: 10,),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    ElevatedButton(
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
    );
  }
}
