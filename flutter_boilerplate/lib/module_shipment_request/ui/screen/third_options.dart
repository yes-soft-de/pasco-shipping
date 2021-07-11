import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ThirdOptions extends StatefulWidget {
  final ShipmentTempRequest _shipmentRequest;
  final Function goBackStep;
  const ThirdOptions(this._shipmentRequest, this.goBackStep);

  @override
  _ThirdOptionsState createState() => _ThirdOptionsState();
}

class _ThirdOptionsState extends State<ThirdOptions> {
  DropListModel dropListModelTime = DropListModel(dataTime);
  DropListModel dropListModelHolderType = DropListModel(holderType);
  late String vehicle;
  late String extra;
  late Entry optionItemSelectedTim = Entry('choose', 1, []);
  late Entry optionItemSelectedType = Entry('choose', 1, []);

  @override
  void initState() {
    super.initState();
    if (widget._shipmentRequest.vehicleIdentificationNumber.isNotEmpty) {
      vehicle = widget._shipmentRequest.vehicleIdentificationNumber;
    } else {
      vehicle = '123...';
    }

    if (widget._shipmentRequest.extraSpecification.isNotEmpty) {
      extra = widget._shipmentRequest.extraSpecification;
    } else {
      extra = 'Text...';
    }

    if(widget._shipmentRequest.paymentTime.isNotEmpty){
      optionItemSelectedTim = Entry(widget._shipmentRequest.paymentTime, 1, []);
    }else {
      optionItemSelectedTim = Entry('choose', 1, []);
    }

    if(widget._shipmentRequest.holderType.isNotEmpty){
      optionItemSelectedType = Entry(widget._shipmentRequest.holderType, 1, []);
    }else {
      optionItemSelectedType = Entry('choose', 1, []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment time : ',
            style: white18text,
          ),
          SelectDropList(
            this.optionItemSelectedTim,
            this.dropListModelTime,
            (optionItem) {
              optionItemSelectedTim = optionItem;
              widget._shipmentRequest.paymentTime = optionItem.title;
              setState(() {});
            },
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Holder type : ',
            style: white18text,
          ),
          SelectDropList(
            this.optionItemSelectedType,
            this.dropListModelHolderType,
                (optionItem) {
              optionItemSelectedType = optionItem;
              widget._shipmentRequest.holderType = optionItem.title;
              setState(() {});
            },
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: widget._shipmentRequest.productCategoryName=='Car' ? true :false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vehicle identification number (if vehicle)',
                  style: white18text,
                ),
                TextEdit(vehicle, 50, (number) {
                  widget._shipmentRequest.vehicleIdentificationNumber = number ?? "";
                }),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Text(
            'Extra specifications',
            style: white18text,
          ),
          TextEdit(extra, 200, (extra) {
            widget._shipmentRequest.extraSpecification = extra;
          }),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 25, end: 25),
            child: RoundedButton(
              radius: 15,
              lable: 'Request',
              icon: '',
              color: Theme.of(context).accentColor,
              go: () {
                _showDialog(context);
              },
              style: mainHeaderBlackStyle,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          widget.goBackStep();
                        },
                        label: Text('Back'),
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      backgroundColor: AppThemeDataService.PrimaryColor,
      confirmBtnColor: AppThemeDataService.AccentColor,
      onConfirmBtnTap: () async{
        print("hereRahaf"+widget._shipmentRequest.toString());
        await setShipment(widget._shipmentRequest);
        Navigator.pop(context);
       await Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.Home, (route) => false);
      },
      text: 'Your request added successfully!',
    );
  }
}
