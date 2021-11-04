import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/holder_request_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/image_full_screen.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(children: [
                    Text(
                      S.of(context).shippingWay,
                      style: AppTextStyle.mediumBlack,
                    ),
                    Text(
                      widget.shipment.transportationType,
                      style: AppTextStyle.smallBlueBold,
                    ),
                  ],),
                ),

                Expanded(
                  child: Row(
                    children: [
                      Text(
                        S.of(context).supplierInfo,
                        style: AppTextStyle.mediumBlack,
                      ),
                      Expanded(
                        child: Text(
                          widget.shipment.supplierName ,
                          style: AppTextStyle.smallBlueBold,
                        ),
                      )
                    ],
                  ),
                ),
                // Expanded(
                //     child: ListTile(
                //         title: Text(
                //           S.of(context).shippingType,
                //           style: AppTextStyle.mediumBlack,
                //         ),
                //         subtitle: Text(
                //           widget.shipment.transportationType,
                //           style: AppTextStyle.smallBlueBold,
                //         ))),
              ],
            ),
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
                        widget.shipment.isExternalWarehouse ? S.of(context).yes:S.of(context).no,
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
                        S.of(context).subCategory,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).shippingType,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.holderType ,
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                child: FlatButton(onPressed: () async{
                  await Printing.layoutPdf(
                    // [onLayout] will be called multiple times
                    // when the user changes the printer or printer settings
                    onLayout: (PdfPageFormat format) {
                      // Any valid Pdf document can be returned here as a list of int
                      return PdfParagraphApi.generateShipmentDetailsReport(widget.shipment);
                    },
                  );



                }, child: Row(children: [
                  Icon(Icons.print, color: black,size: 50,),
                ],)),
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
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 15),
            child: Text(
              S.of(context).holder,
              style: AppTextStyle.mediumBlack,
            ),
          ),

          widget.shipment.holders.isNotEmpty ?
          ListView.builder(itemBuilder: (context , index){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: (){
                  widget.shipment.holders.removeAt(index);
                  setState(() {});
                },
                child: Badge(
                    badgeContent: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 15,
                    ),
                    child: RequestHolderCard(requestHolder:  widget.shipment.holders[index],)),
              ),
            );
          },itemCount: widget.shipment.holders.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ) :Container(),

          widget.shipment.imageFilePath!.isNotEmpty ?
          GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(widget.shipment.imageFilePath!.length, (index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FullImageScreen(widget.shipment.imageFilePath![index],true)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                    child: Image.file(
                      File(widget.shipment.imageFilePath![index]),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
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
           widget.shipment.holderCount = widget.shipment.holders.length;
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
