import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class RequestShipmentReviewInit extends StatefulWidget {
  final ShipmentRequest shipment;
  final Function onSubmit;
  RequestShipmentReviewInit(this.shipment, this.onSubmit);

  @override
  _ContainerShipmentReviewState createState() => _ContainerShipmentReviewState();
}

class _ContainerShipmentReviewState extends State<RequestShipmentReviewInit> {
  // late ShipmentRequest shipment;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).shippingType,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.transportationType,
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                       S.of(context).client,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.userName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                       S.of(context).distributorName,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.distributorName,
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).shippingFrom,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.exportWarehouseName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).shippingTo,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.target,
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),

          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).externalWarehouse,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.isExternalWarehouse.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).warehouseInfo,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.externalWarehouseInfo,
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),

          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).category,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.productCategoryName ,
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).quantity,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.quantity.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).supplierInfo,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.supplierName ,
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).receiverInfo,
                      style: AppTextStyle.mediumBlack,
                    )),
              ),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).name,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.receiverName ,
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).phone,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.receiverPhoneNumber,
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).unit,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.unit ,
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).mark,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.markName,
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),

              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).paymentTime,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.paymentTime ,
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
            ],
          ),
          widget.shipment.imageFilePath!.isNotEmpty ?
          GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              children: List.generate(widget.shipment.imageFilePath!.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                  child: Image.file(
                    File(widget.shipment.imageFilePath![index]),
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                );
              })
          ):Container(),
          ListTile(
              title: Text(
                S.of(context).extraSpecification,
                style: AppTextStyle.mediumBlack,
              ),
              subtitle: Text(
                widget.shipment.extraSpecification,
                style: AppTextStyle.smallBlueBold,
              )),
          RoundedButton(lable: S.of(context).submit, icon: '', color: blue, style: AppTextStyle.largeWhiteBold, go: (){
            widget.onSubmit(widget.shipment);
          }, radius: 12)

        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // widget.shipment = ModalRoute.of(context)!.settings.arguments as ShipmentRequest;
  }
}
