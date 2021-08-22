import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_proxies/request/proxies_request.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ProxyCard extends StatefulWidget {
  final ProxyModel model;
  final Function onDelete;
  final Function onEdit;
  late bool isEdtiable;
  ProxyCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.isEdtiable});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<ProxyCard> {
 late TextEditingController fullName;
 late TextEditingController phone;
 late TextEditingController address;
 late TextEditingController email;


 @override
  void initState() {
   super.initState();
   fullName =TextEditingController();
   fullName..text = widget.model.fullName!;

   phone =TextEditingController();
   phone..text = widget.model.phone!;

   address =TextEditingController();
   address..text = widget.model.address!;

   email =TextEditingController();
   email..text = widget.model.email!;

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
                          S.of(context).name,
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(child: widget.isEdtiable ?
                        TextField(controller: fullName,):  Text(
                          widget.model.fullName ?? '',
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
                          S.of(context).phone,
                          style: AppTextStyle.mediumBlack,
                        ),
                      Expanded(child:   widget.isEdtiable ? TextField(controller: phone, keyboardType: TextInputType.phone,) :  Text(
                          widget.model.phone ?? '',
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
                          S.of(context).address,
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(
                            child:widget.isEdtiable ?
                        TextField(controller: address,) : Text(
                          widget.model.address ?? '',
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
                          S.of(context).email,
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(
                            child:widget.isEdtiable ?
                        TextField(controller: email,) : Text(
                          widget.model.email ?? '',
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
                            S.of(context).delete,
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
                          if(fullName.text.isEmpty || address.text.isEmpty || phone.text.isEmpty){
                            Fluttertoast.showToast(msg: S.of(context).fillAllField);
                          }else {
                            ProxyRequest re = ProxyRequest(id: widget.model.id ,fullName: fullName.text,phone: phone.text,address: address.text, email: email.text);
                            widget.onEdit(re);
                          }

                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              S.of(context).save,
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
                              S.of(context).edit,
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
