import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_subcontract_services/request/sub_contract_service_request.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class SubContractServiceCard extends StatefulWidget {
  final SubContractServiceModel model;
  final Function onDelete;
  final Function onEdit;
  late bool isEdtiable;
  SubContractServiceCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.isEdtiable});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<SubContractServiceCard> {
 late TextEditingController name;
 late TextEditingController description;


 @override
  void initState() {
   super.initState();
   name =TextEditingController();
   name..text = widget.model.name!;

   description =TextEditingController();
   description..text = widget.model.description!;


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
                          S.of(context).service+": ",
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
                          S.of(context).description+": ",
                          style: AppTextStyle.mediumBlack,
                        ),
                      Expanded(child:   widget.isEdtiable ? TextField(controller: description) :  Text(
                          widget.model.description ?? '',
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
                    widget.isEdtiable ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        if(name.text.isEmpty || description.text.isEmpty){
                          Fluttertoast.showToast(msg: S.of(context).fillAllField);
                        }else {
                          SubContractServiceRequest re = SubContractServiceRequest(id: widget.model.id ,name: name.text,description: description.text);
                          widget.onEdit(re);
                        }

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