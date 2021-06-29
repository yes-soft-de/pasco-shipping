import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/text_edit.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class SecondOption extends StatefulWidget {
  const SecondOption();

  @override
  _SecondOptionState createState() => _SecondOptionState();
}

class _SecondOptionState extends State<SecondOption> {
  DropListModel dropListModelUnit = DropListModel(dataUnit);
  DropListModel dropListModelMark = DropListModel(dataMark);

  late Entry optionItemSelectedU = Entry('choose', 1);
  late Entry optionItemSelectedMar = Entry('choose', 1);

  @override
  Widget build(BuildContext context) {
   return  Container(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'Supplier Info : ',
           style: white18text,
         ),
         TextEdit('name here', 50),
         SizedBox(
           height: 25,
         ),
         Text(
           'Recipient Info : ',
           style: white18text,
         ),
         TextEdit('name here', 50),
         TextEdit('phone number', 50),
         SizedBox(
           height: 15,
         ),
         Text(
           'Unit : ',
           style: white18text,
         ),
         SelectDropList(
           this.optionItemSelectedU,
           this.dropListModelUnit,
               (optionItem) {
             optionItemSelectedU = optionItem;
             setState(() {});
           },
         ),
         SizedBox(
           height: 15,
         ),
         Text(
           'Mark : ',
           style: white18text,
         ),
         Row(
           children: [
             Expanded(
               child: SelectDropList(
                 this.optionItemSelectedMar,
                 this.dropListModelMark,
                     (optionItem) {
                   optionItemSelectedMar = optionItem;
                   setState(() {});
                 },
               ),
             ),
             InkWell(
               onTap: () {
                 Navigator.pushNamed(context, MarkRoutes.mark);
               },
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     Icon(
                       Icons.add_circle_outline_sharp,
                       color: AppThemeDataService.AccentColor,
                       size: 25,
                     ),
                     Text(
                       'add\nnew',
                       style: White14text,
                     )
                   ],
                 ),
               ),
             )
           ],
         ),
       ],
     ),
   );
  }
}
