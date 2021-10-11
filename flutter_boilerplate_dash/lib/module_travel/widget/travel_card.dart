import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class TravelsCard extends StatefulWidget {
  final TravelModel model;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;
  // late bool isEdtiable;
  TravelsCard(
      {required this.model, required this.onDelete , required this.onEdit,required this.onDetails});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<TravelsCard> {




 @override
  void initState() {
   super.initState();
   // widget.isEdtiable = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onDetails(widget.model.id);
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
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('#' + widget.model.id.toString() , style: AppTextStyle.largeBlackBold,),
                      Row(
                        children: [
                          Text(
                            S.of(context).travelNumber+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                           Expanded(child: Text(
                            widget.model.travelNumber ?? '',
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
                            S.of(context).launchCountry+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.launchCountry ?? '',
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
                            S.of(context).startDate+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child:Text(widget.model.launchDate!.year ==0000?'': widget.model.launchDate.toString().split(' ').first, style: AppTextStyle.mediumBlueBold,),
                          )],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Text(
                            S.of(context).destinationCountry+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.destinationCountry ?? '',
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
                           S.of(context).arrivalDate+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(widget.model.arrivalDate!.year ==0000?'':widget.model.arrivalDate.toString().split(' ').first, style: AppTextStyle.mediumBlueBold,),
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
                Visibility(
                  visible: widget.model.status == 'current' ? true :false,
                  child: Flexible(
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
