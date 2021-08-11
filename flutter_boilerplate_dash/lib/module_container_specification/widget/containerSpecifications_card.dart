import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ContainerSpecificationCard extends StatefulWidget {
  final ContainerSpecificationModel model;
  final Function onDelete;
  final Function onEdit;
  late bool isEdtiable;
  ContainerSpecificationCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.isEdtiable});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<ContainerSpecificationCard> {
 late TextEditingController fullName;
 late TextEditingController phone;
 late TextEditingController address;


 @override
  void initState() {
   super.initState();
   fullName =TextEditingController();
   // fullName..text = widget.model.fullName!;

   phone =TextEditingController();
   // phone..text = widget.model.phone!;

   address =TextEditingController();
   // address..text = widget.model.address!;
   widget.isEdtiable = false;
  }

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
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name ',
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(child: widget.isEdtiable ?
                        TextField(controller: fullName,):  Text(
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
                          'capacityCPM: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                      Expanded(child:   widget.isEdtiable ? TextField(controller: phone, keyboardType: TextInputType.phone,) :  Text(
                          widget.model.capacityCPM.toString(),
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
                          'lengthInMeter: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(
                            child:widget.isEdtiable ?
                        TextField(controller: address,) : Text(
                          widget.model.lengthInMeter.toString(),
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
                          'hightInMeter: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child:widget.isEdtiable ?
                          TextField(controller: address,) : Text(
                            widget.model.hightInMeter.toString(),
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
                          'widthInMeter: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child:widget.isEdtiable ?
                          TextField(controller: address,) : Text(
                            widget.model.widthInMeter.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}
