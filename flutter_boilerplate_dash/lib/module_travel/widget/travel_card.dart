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
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Travel Number ',
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
                            'SubContract Name: ',
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
                            'Status: ',
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
                            'launch Country: ',
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
                            'launch Date: ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.launchDate.toString().split('.').first,
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
                            'Destination Country: ',
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
                            'Arrival Date: ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(
                            child: Text(
                              widget.model.arrivalDate.toString().split('.').first,
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
                            'Created By ',
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
                            'Created At ',
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
                            'Updated By ',
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
                            'Updated At ',
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
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'delete',
                                style: AppTextStyle.mediumWhite,
                              ),
                            ],
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
                            widget.onEdit(widget.model.id);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'edit',
                                style: AppTextStyle.mediumWhite,
                              ),
                            ],
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
