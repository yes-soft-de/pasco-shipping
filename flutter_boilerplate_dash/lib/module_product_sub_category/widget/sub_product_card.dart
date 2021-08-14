import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_product_sub_category/request/product__sub_caetgory_request.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class SubProductCard extends StatefulWidget {
  final SubProductModel model;
  final Function onDelete;
  final Function onEdit;
  late bool isEdtiable;
  SubProductCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.isEdtiable});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<SubProductCard> {
 late TextEditingController name;
 late TextEditingController description;
 late TextEditingController hsCode;


 @override
  void initState() {
   super.initState();
   name =TextEditingController();
   name..text = widget.model.name!;

   description =TextEditingController();
   description..text = widget.model.description!;

   hsCode =TextEditingController();
   hsCode..text = widget.model.hscode ??'';
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
                          'HsCode: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: widget.isEdtiable ?
                        TextField(controller: hsCode,):  Text(
                          widget.model.hscode ?? '',
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
                          'Product Name: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child :Text(
                          widget.model.productCategoryName ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ))],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Description: ',
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
                          'Created By ',
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
                          'Created At ',
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
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
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
                    Container(
                      width: 100,
                      child:

                      widget.isEdtiable ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          if(name.text.isEmpty || description.text.isEmpty){
                            Fluttertoast.showToast(msg: S.of(context).fillAllField);
                          }else {
                            SubProductRequest re = SubProductRequest(id: widget.model.id ,name: name.text,description: description.text, hscode: hsCode.text, productCategoryID:widget.model.id!);
                            widget.onEdit(re);
                          }

                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              color: Colors.white,
                            ),

                            Text(
                              'save',
                              style: AppTextStyle.mediumWhite,
                            ),
                          ],
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
