import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/request/container_specification_request.dart';
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
 late TextEditingController name;
 late TextEditingController capacity;
 late TextEditingController length;
 late TextEditingController width;
 late TextEditingController height;
 late TextEditingController price;


 @override
  void initState() {
   super.initState();
   name =TextEditingController();
   name..text = widget.model.name!;

   capacity =TextEditingController();
   capacity..text = widget.model.capacityCPM!;

   width =TextEditingController();
   width..text = widget.model.widthInMeter!;

   height =TextEditingController();
   height..text = widget.model.hightInMeter!;

   length =TextEditingController();
   length..text = widget.model.lengthInMeter!;

   price =TextEditingController();
   price..text = widget.model.price!;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          S.of(context).name,
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(child: widget.isEdtiable ?
                        TextField(controller: name,):  Text(
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
                          S.of(context).capacityCPM,
                          style: AppTextStyle.mediumBlack,
                        ),
                      Expanded(child:   widget.isEdtiable ? TextField(controller: capacity, keyboardType: TextInputType.phone,) :  Text(
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
                          S.of(context).lengthInMeter,
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(
                            child:widget.isEdtiable ?
                        TextField(controller: length,) : Text(
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
                          S.of(context).heightInMeter,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child:widget.isEdtiable ?
                          TextField(controller: height,) : Text(
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
                          S.of(context).widthInMeter,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child:widget.isEdtiable ?
                          TextField(controller: width,) : Text(
                            widget.model.widthInMeter.toString(),
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
                          S.of(context).prices+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child:widget.isEdtiable ?
                          TextField(controller: price,) : Text(
                            widget.model.price.toString(),
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
                    widget.isEdtiable ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        ContainerSpecificationRequest re = ContainerSpecificationRequest(id: widget.model.id ,widthInMeter: width.text,hightInMeter: height.text,lengthInMeter: length.text ,name: name.text,capacityCPM: capacity.text,price: price.text);
                        widget.onEdit(re);
                      },
                      child: Text(
                        S.of(context).save,
                        style: AppTextStyle.mediumWhite,
                      ),
                    ) : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.isEdtiable= true;
                        });
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
