import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/request/country_request.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class CountryCard extends StatefulWidget {
  final CountryModel model;
  final Function onDelete;
  final Function onEdit;
  late bool isEdtiable;
   CountryCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.isEdtiable});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
 late TextEditingController name;
 late TextEditingController type;
 late TextEditingController code;


 @override
  void initState() {
   super.initState();
   name =TextEditingController();
   name..text = widget.model.name!;

   type =TextEditingController();
   type..text = widget.model.type!;

   code =TextEditingController();
   code..text = widget.model.callingCode!;
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.isEdtiable ?
                  Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: TextField(controller: name,))
                      : Text(
                    widget.model.name ?? '',
                    style: AppTextStyle.largeBlack,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        S.of(context).countryType,
                        style: AppTextStyle.mediumBlack,
                      ),
                      widget.isEdtiable ? Container(
                          width: 75,
                          child: TextField(controller: type,)) :  Text(
                        widget.model.type ?? '',
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
                        S.of(context).callingCode,
                        style: AppTextStyle.mediumBlack,
                      ),
                      widget.isEdtiable ? Container(
                          width: 100,
                          child: TextField(controller: code,)) : Text(
                        widget.model.callingCode ?? '',
                        style: AppTextStyle.mediumBlueBold,
                      ),
                    ],
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
              Column(
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
                        CountryRequest re = CountryRequest(id: widget.model.id ,code: code.text,countryName: name.text,type: type.text);
                        widget.onEdit(re);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
