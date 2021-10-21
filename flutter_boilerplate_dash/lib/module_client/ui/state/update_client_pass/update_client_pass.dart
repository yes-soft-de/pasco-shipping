import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/request/create_client_request.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class UpdateClientPassInit extends StatefulWidget {
  final Function onUpdate;
  final ClientModel model;
  const UpdateClientPassInit({ required this.onUpdate,required this.model});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<UpdateClientPassInit> {

  late  TextEditingController password;


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).password , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: TextField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).password,

                    ),
                  ),
                ),
              ),

              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                  UpdateClientPassRequest re = UpdateClientPassRequest(
                    id: widget.model.id,
                      password: password.text ,
                  );
                  widget.onUpdate(re);
              }, radius: 15)
            ],),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    password = TextEditingController();
    password..text ='';
    // isPass=true;
  }

}