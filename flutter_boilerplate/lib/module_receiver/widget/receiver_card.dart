import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_mark/model/markModel.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ReceiverCard extends StatefulWidget {
  final ReceiverModel model;
  final Function onDelete;
  final Function onEdit;
  late bool isEdtiable;
  ReceiverCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.isEdtiable});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<ReceiverCard> {
  late TextEditingController fullName;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController email;


  @override
  void initState() {
    super.initState();
    fullName =TextEditingController();
    fullName..text = widget.model.fullName??'';

    phone =TextEditingController();
    phone..text = widget.model.phone??'';

    address =TextEditingController();
    address..text = widget.model.address??'';

    email =TextEditingController();
    email..text = widget.model.email ??'';

    widget.isEdtiable = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5.0,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
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
                          S.of(context).fullName,
                          style: white16text,
                        ),
                        Expanded(child: widget.isEdtiable ?
                        TextField(controller: fullName, style: white18text,):  Text(
                          widget.model.fullName ?? '',
                          style: white18text,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).phone+": ",
                          style: white16text,
                        ),
                        Expanded(child:   widget.isEdtiable ? TextField(controller: phone, keyboardType: TextInputType.phone, style: white18text,) :  Text(
                          widget.model.phone ?? '',
                          style: white16text,
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
                          style: white16text,
                        ),
                        Expanded(
                          child:widget.isEdtiable ?
                          TextField(controller: address, style: white18text,) : Text(
                            widget.model.address ?? '',
                            style: white16text,
                          ),
                        )],
                    ),


                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       S.of(context).email+": ",
                    //       style: white16text,
                    //     ),
                    //     Expanded(
                    //       child:widget.isEdtiable ?
                    //       TextField(controller: email, style: white18text,) : Text(
                    //         widget.model.email ?? '',
                    //         style: white16text,
                    //       ),
                    //     )],
                    // ),
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
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // widget.isEdtiable ? ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.green,
                    //   ),
                    //   onPressed: () {
                    //     if(fullName.text.isEmpty || address.text.isEmpty || phone.text.isEmpty){
                    //       Fluttertoast.showToast(msg: S.of(context).fillAllField);
                    //     }else {
                    //       // SupplierRequest re = SupplierRequest(id: widget.model.id ,fullName: fullName.text,phone: phone.text,address: address.text);
                    //       // widget.onEdit(re);
                    //     }
                    //
                    //   },
                    //   child: Text(
                    //     S.of(context).save,
                    //
                    //   ),
                    // ) :
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.green,
                    //   ),
                    //   onPressed: () {
                    //     setState(() {
                    //       widget.isEdtiable= true;
                    //     });
                    //   },
                    //   child: Text(
                    //     S.of(context).edit,
                    //   ),
                    // ),
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
