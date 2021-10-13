import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';
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
  final List<ContainerSpecificationModel> specifications;
  final Function updatePrice;
  const PriceSuccessfullyScreen(
      {required this.model,
      required this.updatePrice,
      required this.specifications});

  @override
  _ProfileSuccessfullyScreenState createState() =>
      _ProfileSuccessfullyScreenState();
}

class _ProfileSuccessfullyScreenState extends State<PriceSuccessfullyScreen> {
  late final TextEditingController _oneKiloPrice;
  late final TextEditingController _oneCBMPrice;
  late final TextEditingController _price;

  late ScrollController controller;

  late PriceRequest _priceRequest;

  late DropListModel dropListModelSpecification;
  late Entry optionItemSelectedSpecification;
  late List<Entry> entrySpecification;
  @override
  void initState() {
    super.initState();
    _oneCBMPrice = TextEditingController();
    _oneCBMPrice..text = widget.model.oneCBMPrice!;

    _oneKiloPrice = TextEditingController();
    _oneKiloPrice..text = widget.model.oneKiloPrice!;

    controller = ScrollController();
    entrySpecification = <Entry>[];
    optionItemSelectedSpecification = Entry('choose', 0, []);
    _price = TextEditingController();
    _price..text = '0';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (ContainerSpecificationModel item in widget.specifications) {
      Entry v = Entry(
          item.name!, item.id!, [Entry(item.price ?? '', item.id ?? 0, [])]);
      entrySpecification.add(v);
    }
    dropListModelSpecification = DropListModel(entrySpecification);
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
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 30, end: 30, top: 15),
            child: Card(
              margin: new EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            cursorColor: AppThemeDataService.AccentColor,
                            controller: _oneKiloPrice,
                            decoration: InputDecoration(
                                enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppThemeDataService.AccentColor)),
                                suffixIcon: Icon(Icons.monetization_on_outlined,
                                    color: blue),
                                labelText: 'One kilo price',
                                labelStyle: AppTextStyle.largeBlack),
                            style: AppTextStyle.mediumBlue,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            // onEditingComplete: () => node.nextFocus(),
                            // Move focus to next
                            validator: (result) {
                              if (result == null) {
                                return S.of(context).required;
                              } else {
                                if (result.isEmpty) {
                                  return S.of(context).required;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            cursorColor: AppThemeDataService.AccentColor,
                            controller: _oneCBMPrice,
                            decoration: InputDecoration(
                                enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppThemeDataService.AccentColor)),
                                suffixIcon: Icon(
                                  Icons.monetization_on_outlined,
                                  color: blue,
                                ),
                                labelText: 'One CBM Price',
                                labelStyle: AppTextStyle.largeBlack),
                            style: AppTextStyle.mediumBlue,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            // Move focus to next
                            validator: (result) {
                              if (result == null) {
                                return S.of(context).required;
                              } else {
                                if (result.isEmpty) {
                                  return S.of(context).required;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Container Prices',
            style: AppTextStyle.mediumBlackBold,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: AppThemeDataService.AccentColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  S.of(context).specification,
                  style: AppTextStyle.mediumBlackBold,
                )
              ],
            ),
          ),
          SelectDropList(
            this.optionItemSelectedSpecification,
            this.dropListModelSpecification,
            (optionItem) {
              optionItemSelectedSpecification = optionItem;
              setState(() {
                _price..text = optionItemSelectedSpecification.children[0].title;
              });
            },
          ),
          optionItemSelectedSpecification.id != 0
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(S.of(context).type + ': '),
                            Text(
                              optionItemSelectedSpecification.title,
                              style: AppTextStyle.mediumBlackBold,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: Text(S.of(context).prices + ': ')),
                            Flexible(
                                flex: 3,
                                child: TextField(controller: _price,))
                          ],
                        ),
                      ],
                    ),
                  )),
                )
              : Container(),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: RoundedButton(
              radius: 15,
              lable: S.of(context).saveInfo,
              icon: StaticImage.edit,
              color: AppThemeDataService.AccentColor,
              go: () {
                _priceRequest = PriceRequest(
                    oneKiloPrice: _oneKiloPrice.text,
                    oneCBMPrice: _oneCBMPrice.text,
                    containerSpecificationID: optionItemSelectedSpecification.id,
                    containerSpecificationPrice:int.parse(_price.text),
                    id: widget.model.id);
                widget.updatePrice(_priceRequest);
              },
              style: AppTextStyle.mediumWhiteBold,
            ),
          )
        ],
      ),
    );
  }

}
