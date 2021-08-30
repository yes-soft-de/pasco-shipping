import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class WarehouseCard extends StatefulWidget {
  final WarehousesModel model;
  final Function onDelete;
  final Function onEdit;
  final Function onShowFinance;
  // late bool isEdtiable;
  WarehouseCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.onShowFinance});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<WarehouseCard> {
 late TextEditingController name;
 late TextEditingController description;


 @override
  void initState() {
   super.initState();
   name =TextEditingController();
   name..text = widget.model.name!;
   //
   // description =TextEditingController();
   // description..text = widget.model.description!;


   // widget.isEdtiable = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onShowFinance(widget.model.id);
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
                           S.of(context).name,
                            style: AppTextStyle.mediumBlack,
                          ),
                           Expanded(child:   Text(
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
                            S.of(context).country,
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
                            S.of(context).city,
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(child:   Text(
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
                            S.of(context).location,
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(child:  Text(
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
                            S.of(context).proxy+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(child:  Text(
                            widget.model.proxyName ?? '',
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
                            S.of(context).subcontract+': ',
                            style: AppTextStyle.mediumBlack,
                          ),
                          Expanded(child:  Text(
                            widget.model.subContractName ?? '',
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
      ),
    );
  }
}
