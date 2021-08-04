import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class ContainerShipmentReview extends StatefulWidget {
  // final ShipmentModel shipment;
  ContainerShipmentReview();

  @override
  _ContainerShipmentReviewState createState() => _ContainerShipmentReviewState();
}

class _ContainerShipmentReviewState extends State<ContainerShipmentReview> {
  late ShipmentModel shipment;
  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
      title: 'shipment review',
      goBack: (){},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Shipment from: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.exportWarehouseName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Shipment to: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.target ??'',
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
                        shipment.productCategoryName ?? '',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Quantity ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.quantity.toString(),
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
                      shipment.supplierName ?? '',
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
              Expanded(
                child: ListTile(
                    title: Text(
                      'Weight: ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      shipment.weight.toString(),
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
                        shipment.receiverName ??'',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Phone: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.receiverPhoneNumber ??'',
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
                          shipment.unit ??'',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Mark ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.markNumber??'',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Payment time ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.paymentTime ?? '',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Extra specification ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.extraSpecification ??'',
                          style: AppTextStyle.smallBlueBold,
                        )),
                  ],
                ),
              ),
            ],
          ),

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
    shipment = ModalRoute.of(context)!.settings.arguments as ShipmentModel;
  }
}
