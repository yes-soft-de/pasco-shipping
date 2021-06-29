import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/text_edit.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ThirdOptions extends StatefulWidget {
  const ThirdOptions();

  @override
  _ThirdOptionsState createState() => _ThirdOptionsState();
}

class _ThirdOptionsState extends State<ThirdOptions> {
  DropListModel dropListModelTime = DropListModel(dataTime);
  late Entry optionItemSelectedTim = Entry('choose', 1);


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
              setState(() {});
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Vehicle identification number (if vehicle)',
            style: white18text,
          ),
          TextEdit('123...', 50),
          SizedBox(
            height: 20,
          ),
          Text(
            'Extra specifications',
            style: white18text,
          ),
          TextEdit('TEXT....', 200),
          Padding(
            padding:
            const EdgeInsetsDirectional.only(start: 25, end: 25),
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
          )
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
      text: 'Your request added successfully!',
    );
  }
}
