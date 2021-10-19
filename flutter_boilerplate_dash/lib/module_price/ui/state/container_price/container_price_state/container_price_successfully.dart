import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/container_price_response.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';
import 'package:pasco_shipping/module_price/widget/container_price_dart.dart';
import 'package:pasco_shipping/module_price/widget/line_price_card.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

class ContainerPriceSuccessfullyScreen extends StatefulWidget {
  final List<ContainerPriceModel> model;
  final Function updateContainerPrice;
  const ContainerPriceSuccessfullyScreen(
      {required this.model,
      required this.updateContainerPrice});

  @override
  _ProfileSuccessfullyScreenState createState() =>
      _ProfileSuccessfullyScreenState();
}

class _ProfileSuccessfullyScreenState extends State<ContainerPriceSuccessfullyScreen> {
  late final TextEditingController _oneKiloPrice;
  late final TextEditingController _oneCBMPrice;
  // late final TextEditingController _price;

  late ScrollController controller;

  late ContainerPriceRequest _priceRequest;

  late DropListModel dropListModelSpecification;
  late Entry optionItemSelectedSpecification;
  late List<Entry> entrySpecification;
  @override
  void initState() {
    super.initState();
    // _oneCBMPrice = TextEditingController();
    // _oneCBMPrice..text = widget.model.oneCBMPrice!;
    //
    // _oneKiloPrice = TextEditingController();
    // _oneKiloPrice..text = widget.model.oneKiloPrice!;

    controller = ScrollController();
    // entrySpecification = <Entry>[];
    // optionItemSelectedSpecification = Entry('choose', 0, []);
    // _price = TextEditingController();
    // _price..text = '0';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  //   for (ContainerSpecificationModel item in widget.specifications) {
  //     Entry v = Entry(
  //         item.name!, item.id!, [Entry('0' ?? '', item.id ?? 0, [])]);
  //     entrySpecification.add(v);
  //   }
  //   dropListModelSpecification = DropListModel(entrySpecification);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: white)),
              margin: EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(StaticImage.price),
              )),
          Text(
            'Container Prices',
            style: AppTextStyle.largeBlackBold,
          ),
          ListView.builder(itemBuilder: (context ,index){
            return ContainerPriceCard(model: widget.model[index],
              onEditPrice: (model){
              widget.updateContainerPrice(model);
            },);
          },
            shrinkWrap: true,
            itemCount: widget.model.length,
            physics: NeverScrollableScrollPhysics(),
          ),
          // Text(
          //   'Container Prices',
          //   style: AppTextStyle.largeBlackBold,
          // ),
          // ListView.builder(itemBuilder: (context ,index){
          //   return ContainerPriceCard(model: widget.model.containerPrice[index],);
          // },
          //   shrinkWrap: true,
          //   itemCount: widget.model.containerPrice.length,
          //   physics: NeverScrollableScrollPhysics(),
          // ),

        ],
      ),
    );
  }

}
