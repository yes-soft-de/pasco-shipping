import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
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

class PriceSuccessfullyScreen extends StatefulWidget {
  final PriceModel model;
  final Function updateLinesPrice;
  const PriceSuccessfullyScreen(
      {required this.model,
      required this.updateLinesPrice});

  @override
  _ProfileSuccessfullyScreenState createState() =>
      _ProfileSuccessfullyScreenState();
}

class _ProfileSuccessfullyScreenState extends State<PriceSuccessfullyScreen> {
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
          // Text(
          //   'Container Prices',
          //   style: AppTextStyle.largeBlackBold,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.circle,
          //         color: AppThemeDataService.AccentColor,
          //       ),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       Text(
          //         S.of(context).specification,
          //         style: AppTextStyle.mediumBlackBold,
          //       )
          //     ],
          //   ),
          // ),
          // SelectDropList(
          //   this.optionItemSelectedSpecification,
          //   this.dropListModelSpecification,
          //       (optionItem) {
          //     optionItemSelectedSpecification = optionItem;
          //     setState(() {
          //       _price..text = optionItemSelectedSpecification.children[0].title;
          //     });
          //   },
          // ),
          // optionItemSelectedSpecification.id != 0
          //     ? Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Card(
          //       child: Padding(
          //         padding: const EdgeInsets.all(10.0),
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Text(S.of(context).type + ': '),
          //                 Text(
          //                   optionItemSelectedSpecification.title,
          //                   style: AppTextStyle.mediumBlackBold,
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Flexible(
          //                     flex: 1,
          //                     child: Text(S.of(context).prices + ': ')),
          //                 Flexible(
          //                     flex: 3,
          //                     child: TextField(controller: _price,))
          //               ],
          //             ),
          //           ],
          //         ),
          //       )),
          // )
          //     : Container(),
          // Padding(
          //   padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          //   child: RoundedButton(
          //     radius: 15,
          //     lable: S.of(context).saveInfo,
          //     icon: StaticImage.edit,
          //     color: AppThemeDataService.AccentColor,
          //     go: () {
          //       _priceRequest = ContainerPriceRequest(
          //         containerSpecificationID: optionItemSelectedSpecification.id,
          //         containerSpecificationPrice:int.parse(_price.text),);
          //       widget.updateContainerPrice(_priceRequest);
          //     },
          //     style: AppTextStyle.mediumWhiteBold,
          //   ),
          // ),


          Text(
            'Lines Prices',
            style: AppTextStyle.largeBlackBold,
          ),
          ListView.builder(itemBuilder: (context ,index){
            return LinePriceCard(model: widget.model.linesPrice[index],
              onEditLines: (model){
              widget.updateLinesPrice(model);
            },);
          },
            shrinkWrap: true,
            itemCount: widget.model.linesPrice.length,
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
