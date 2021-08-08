import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                        'Client name: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.userName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'distributorName: ',
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
                        'Shipment from: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.exportWarehouseName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Shipment to: ',
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
                        'External Warehouse: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.isExternalWarehouse.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'External Warehouse Info: ',
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
                        'Product type: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.productCategoryName ,
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Quantity ',
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
                      'Supplier Info: ',
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
                      'Recipient Info: ',
                      style: AppTextStyle.mediumBlack,
                    )),
              ),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Name: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.receiverName ,
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Phone: ',
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
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    ListTile(
                        title: Text(
                          'Unit: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          widget.shipment.unit ,
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Mark ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          widget.shipment.markName,
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Payment time ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          widget.shipment.paymentTime ,
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Extra specification ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          widget.shipment.extraSpecification,
                          style: AppTextStyle.smallBlueBold,
                        )),
                  ],
                ),
              ),
            ],
          ),

          RoundedButton(lable: 'Submit', icon: '', color: blue, style: AppTextStyle.largeWhiteBold, go: (){
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
