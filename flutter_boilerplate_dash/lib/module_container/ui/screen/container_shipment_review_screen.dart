import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
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
      title: S.of(context).shipmentReview,
      goBack: (){},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).shippingFrom,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.exportWarehouseName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).shippingTo,
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
                        S.of(context).productCategory,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.productCategoryName ?? '',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).quantity,
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
                      S.of(context).supplierInfo,
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
                      S.of(context).weight,
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
                        shipment.receiverName ??'',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).phone,
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
                          S.of(context).unit,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.unit ??'',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          S.of(context).mark,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.markNumber??'',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          S.of(context).paymentTime,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.paymentTime ?? '',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          S.of(context).extraSpecification,
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
